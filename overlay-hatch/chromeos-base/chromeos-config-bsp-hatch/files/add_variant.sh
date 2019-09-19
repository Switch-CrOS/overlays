#!/bin/bash
# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

if [[ ! -e /etc/cros_chroot_version ]]; then
  echo "This script must be run inside the chroot"
  exit 1
fi

if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 variant_name [bug_number]"
  echo "e.g. $0 kohaku b:140261109"
  echo "Adds a new device and unprovisioned SKU to the YAML file for"
  echo "the variant being created. Revbump the ebuild"
  exit 1
fi

BASE="hatch"
# ${var,,} converts to all lowercase, ${var^} capitalizes first letter only.
VARIANT="${1,,}"
VARIANT_CAPITALIZED="${VARIANT^}"

YAML=model.yaml

# Assign BUG= text, or "None" if that parameter wasn't specified.
BUG=${2:-None}

# All of the necessary files are in the same directory as this script.
pushd "${BASH_SOURCE%/*}" || exit 1

if [[ ! -e "${YAML}" ]]; then
  echo "${YAML} does not exist."
  exit 1
fi

# Make sure the variant doesn't already exist in the yaml file.
if grep -qi "${VARIANT}" "${YAML}" ; then
  echo "${VARIANT} already appears to exist in ${YAML}"
  echo "Have you already created this variant?"
  exit 1
fi

# Start a branch. Use YMD timestamp to avoid collisions.
DATE=$(date +%Y%m%d)
repo start "create_${VARIANT}_${DATE}" . || exit 1

# We need to revbump the ebuild file. It has the version number in
# its name, and furthermore, it's a symlink to another ebuild file.
#
# Find a symlink named *.ebuild, should be only one.
EBUILD=$(find .. -name "*.ebuild" -type l)
# Remove the extension
F=${EBUILD%.ebuild}
# Get the numeric suffix after the 'r'.
# If $F == ./coreboot-private-files-hatch-0.0.1-r30
# then we want '30'.
# We need to reverse the string because cut only supports cutting specific
# fields from the start a string (you can't say N-1, N-2 in general) and
# we need the last fields.
REVISION=$(echo "${F}" | rev | cut -d- -f 1 | cut -dr -f 1 | rev)
# Incremement
NEWREV=$((REVISION + 1))
# Replace e.g. 'r30' with 'r31' in the file name
NEWEBUILD="${EBUILD/r${REVISION}.ebuild/r${NEWREV}.ebuild}"
# Rename
git mv "${EBUILD}" "${NEWEBUILD}"

# Append a new device-name to the end of the model.yaml file.
cat <<EOF >>"${YAML}"
    - \$device-name: "unprovisioned_${VARIANT}"
      \$fw-name: "${VARIANT_CAPITALIZED}"
      products:
        - \$key-id: "HATCH"
      skus:
        - \$sku-id: 255
          config: *common_config
EOF
git add "${YAML}"

# TODO automate the steps in the TEST= part of the commit message below.

# Now commit the files.
git commit -sm "model.yaml: Add ${VARIANT} variant

BUG=${BUG}
BRANCH=none
TEST=emerge-${BASE} chromeos-config-bsp-${BASE}
chromeos-config-bsp-${BASE}-private chromeos-config-bsp chromeos-config
 Check /build/${BASE}/usr/share/chromeos-config for '${VARIANT}' in
 config.json, yaml/config.c, and yaml/*.yaml"

echo "Please check all the files (git show), make any changes you want,"
echo "and then repo upload."
