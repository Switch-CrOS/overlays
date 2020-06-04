# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit appid
inherit cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="zork-kernelnext"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config
"

src_install() {
	if use zork-kernelnext; then
		doappid "{D694EA84-A2C3-11EA-98E4-DFA8D65B1A07}" "CHROMEBOOK"
	else
		doappid "{0BE68F68-A2F2-46B7-A7B4-B51B63F64FBA}" "CHROMEBOOK"
	fi

	# Install Bluetooth ID override
	insinto /etc/bluetooth
	doins "${FILESDIR}"/main.conf

	unibuild_install_audio_files
}
