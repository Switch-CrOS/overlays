# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-config
	chromeos-base/chromeos-bsp-baseboard-cherry
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{D756EC88-0BC0-4875-ABFC-2B67369526AC}" "CHROMEBOOK"

	# Install audio config
	unibuild_install_files audio-files
}
