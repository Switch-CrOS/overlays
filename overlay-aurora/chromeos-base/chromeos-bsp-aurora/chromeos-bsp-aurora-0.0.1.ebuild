# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit appid cros-unibuild

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="hatch-arc-r hatch-borealis hatch-diskswap hatch-kvm hatch-kernelnext hatch-blueznext hatch-manatee"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-hatch
"
DEPEND="
	${RDEPEND}
"

src_install() {
	if use aurora-borealis; then
		doappid "{567CE7C6-688F-897C-6C1A-0F4C15CC24E7}" "CHROMEBOOK"
	else
		doappid "{DD70ECA8-C39D-2BAA-055C-9094D3A78BE1}" "CHROMEBOOK"
	fi

}
