#!/bin/bash
#
# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# This script repacks the kernel squash and updates the ebuild automatically
# according to the given patchset url or the patch id.
# If the patchset number is unspecified, this script will use the latest
# patchset to generate the kernel squash.
#
# Examples:
#     sh repack.sh https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2206575/12
#     sh repack.sh https://crrev.com/c/2206575/
#     sh repack.sh CL:2206575/12
#     sh repack.sh 2206575

set -e

info() {
  echo -e "\e[1;32m$*\e[0m"
}

generate_new_squash() {
  info "Running \`git fetch cros\` in ${kernel_dir}..."

  pushd "${kernel_dir}"
  git fetch cros

  local patch_info

  patch_info="$(sed -E 's/[^0-9]*(.*[0-9]+).*/\1/' <<< "$1")"
  patch_id="${patch_info%/*}"
  patchset="${patch_info#*/}"


  if [[ "${patch_info}" == "${patchset}" ]]; then
    info "Getting the latest patchset number of CL:${patch_id}..."
    patchset="$(git ls-remote cros "refs/changes/${patch_id: -2}/${patch_id}*" \
      | awk -F/ '{print $5}' | sort -n | tail -n1)"
  fi

  info "Fetching CL:${patch_id}/${patchset}..."
  git fetch "https://chromium.googlesource.com/chromiumos/third_party/kernel" \
    refs/changes/"${patch_id: -2}"/"${patch_id}"/"${patchset}"

  base="$(git merge-base cros/chromeos-5.4 FETCH_HEAD)"
  tree="$(git cat-file -p "${base}" | sed -n 's/tree //p')"

  info "Generating new squash..."
  git diff --full-index "${base}" FETCH_HEAD > \
    "${ebuild_dir}"/files/asurada-tot.patch

  popd
}

update_ebuild() {
  info "Updating and upreving ebuild..."

  local old_base
  local old_tree

  pushd "${ebuild_dir}"

  old_base="$(grep CROS_WORKON_COMMIT ./*.ebuild | cut -d \" -f 2)"
  old_tree="$(grep CROS_WORKON_TREE ./*.ebuild | cut -d \" -f 2)"
  version="$(find ./*.ebuild | sed -Ee 's/.*\.([0-9]*).ebuild/\1/')"

  sed -i s/"${old_base}"/"${base}"/g chromeos-kernel-5_4-0.0."${version}".ebuild
  sed -i s/"${old_tree}"/"${tree}"/g chromeos-kernel-5_4-0.0."${version}".ebuild
  mv chromeos-kernel-5_4-0.0."${version}".ebuild \
    chromeos-kernel-5_4-0.0."$((version + 1))".ebuild

  popd
}

commit_change() {
  info "Committing change..."

  local tot_commit_id
  local tot_name

  pushd "${kernel_dir}"

  tot_commit_id="$(git log FETCH_HEAD -n 1 --pretty=format:"%h")"
  tot_name="$(git log FETCH_HEAD -n 1 --pretty=format:"%s" | \
    sed -E 's/DO-NOT-SUBMIT: (.*[^\.]).*/\1/' | tr -d '"')"

  popd

  pushd "${ebuild_dir}"

  local commit_msg
  read -r -d \" commit_msg <<END
asurada: update ebuild with private patch for kernel 5.4

Apply ${tot_name} #${patchset} (CL:${patch_id}/${patchset}, ${tot_commit_id}) on commit ${base:0:13}.

git fetch cros

git merge-base cros/chromeos-5.4 ${tot_commit_id}
> ${base}

git cat-file -p ${base} | sed -n 's/tree //p'
> ${tree}

diff generated with
git diff --full-index ${base} ${tot_commit_id} > asurada-tot.patch
by running \`sh repack.sh $1\`

BUG=b:153619974
TEST=cros_workon-asurada stop chromeos-kernel-5_4
     emerge-asurada chromeos-kernel-5_4
"
END

  git add chromeos-kernel-5_4-0.0."${version}".ebuild
  git add chromeos-kernel-5_4-0.0."$((version + 1))".ebuild
  git add files/asurada-tot.patch
  git commit -m "${commit_msg}"
  git commit --amend

  popd
}

script="$(realpath "${BASH_SOURCE[0]}")"
kernel_dir="${script%overlays*}third_party/kernel/v5.4"
ebuild_dir="$(dirname "${script}")/.."

patch_id=""
patchset=""
base=""
tree=""
version=""

generate_new_squash "$1"
update_ebuild
commit_change "$1"

info "Please run \`cros_workon-asurada stop chromeos-kernel-5_4 &&"\
  "emerge-asurada chromeos-kernel-5_4\` in chroot to verify the result."

