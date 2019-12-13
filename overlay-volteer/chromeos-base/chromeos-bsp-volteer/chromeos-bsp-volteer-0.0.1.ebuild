# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-volteer
	chromeos-base/sof-binary
	chromeos-base/sof-topology
	!<chromeos-base/chromeos-bsp-volteer-private-0.0.2
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	doappid "{77BE25D7-AFB8-4E3C-A7D2-1FACE1B186E3}" "REFERENCE"

	unibuild_install_audio_files
}
