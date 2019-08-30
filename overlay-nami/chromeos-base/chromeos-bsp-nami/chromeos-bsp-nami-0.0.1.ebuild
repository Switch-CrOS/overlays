# Copyright 2017 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid
inherit cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="nami-kvm"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-nami
	chromeos-base/rmi4utils
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {

	if use nami-kvm; then
		doappid "{DB6012BC-8758-4280-B40D-41F2792F46B9}" "CHROMEBOOK"
	else
		doappid "{495DCB07-E19A-4D7D-99B9-4710011A65B1}" "CHROMEBOOK"
	fi

	unibuild_install_audio_files
	unibuild_install_thermal_files
	unibuild_install_bluetooth_files
}
