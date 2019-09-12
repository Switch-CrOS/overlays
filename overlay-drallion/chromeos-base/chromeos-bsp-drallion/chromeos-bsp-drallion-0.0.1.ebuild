# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid cros-unibuild udev

DESCRIPTION="Drallion board-specific ebuild that pulls in necessary ebuilds as
dependencies or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="* amd64 x86"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND=""
DEPEND="
        ${RDEPEND}
        chromeos-base/chromeos-config
"

src_install() {
	doappid "{ED3A4869-C380-4F79-A190-027C3E879357}" "CHROMEBOOK"

	# Intall a rule tagging keyboard as having updated layout
	udev_dorules "${FILESDIR}/81-drallion-keyboard.rules"

	unibuild_install_audio_files 
}
