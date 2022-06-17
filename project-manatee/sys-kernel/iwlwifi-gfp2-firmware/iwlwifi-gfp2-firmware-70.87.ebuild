# Copyright (c) 2022 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
CROS_WORKON_COMMIT="24e883d75affd4c59a755cbbb97328d057886ac0"
CROS_WORKON_TREE="b13253801fa1a60b0d1669abe8a4b776fbd762b3"
CROS_WORKON_PROJECT="chromiumos/third_party/linux-firmware"
CROS_WORKON_LOCALNAME="linux-firmware"
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_EGIT_BRANCH="master"
CROS_WORKON_MANUAL_UPREV=1

inherit cros-workon

DESCRIPTION="Intel Core 70 firmware images from the upstream linux-fimware package"
HOMEPAGE="https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/"
LICENSE="LICENCE.iwlwifi_firmware"

SLOT="0"
KEYWORDS="*"
RESTRICT="binchecks strip"

src_install() {
	insinto /lib/firmware
	doins "iwlwifi-so-a0-gf-a0-73.ucode"
	doins "iwlwifi-so-a0-gf-a0.pnvm"
	doins "iwl-dbg-cfg.ini"
}
