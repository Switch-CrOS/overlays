# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Chrome OS BSP virtual package"
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* amd64"

DEPEND="
	!chromeos-base/chromeos-bsp-hatch
	chromeos-base/chromeos-bsp-palkia
"
RDEPEND="${DEPEND}"
