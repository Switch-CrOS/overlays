# Copyright (c) 2022 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
CROS_WORKON_COMMIT="3039cb162bcbf8c3ed19e0f7d5fca14ba333110c"
CROS_WORKON_TREE="43337b6ad3da1eb03cb95297e48222398c933a73"
CROS_WORKON_PROJECT="chromiumos/third_party/linux-firmware"
CROS_WORKON_LOCALNAME="linux-firmware"
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_EGIT_BRANCH="master"
CROS_WORKON_MANUAL_UPREV=1

inherit cros-workon

DESCRIPTION="Intel Core 69 firmware images from the upstream linux-fimware package"
HOMEPAGE="https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/"
LICENSE="LICENCE.iwlwifi_firmware"

SLOT="0"
KEYWORDS="*"
RESTRICT="binchecks strip"

src_install() {
	insinto /lib/firmware
	doins "iwlwifi-so-a0-gf-a0-72.ucode"
	doins "iwlwifi-so-a0-gf-a0.pnvm"
	doins "iwl-dbg-cfg.ini"
}
