# Copyright 2020 The Chromium OS Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Chrome OS BSP virtual package"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"

RDEPEND="
	chromeos-base/chromeos-bsp-deltaur
	chromeos-base/chromeos-bsp-wilco
"
