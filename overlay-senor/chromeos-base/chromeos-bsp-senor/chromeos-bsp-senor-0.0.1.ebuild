# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit appid

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE=""
S="${WORKDIR}"

RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-herobrine
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{3553C43A-6C07-3262-5BBD-9EB48D07669E}" "REFERENCE"
}
