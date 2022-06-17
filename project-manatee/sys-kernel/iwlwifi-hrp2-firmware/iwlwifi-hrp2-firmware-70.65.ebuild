# Copyright (c) 2022 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
CROS_WORKON_COMMIT="823355c312c86ba75f34db2787644e7207e1dafa"
CROS_WORKON_TREE="926b1ea2371562637c1aab3db3b30181b6991595"
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
	doins "iwlwifi-QuZ-a0-hr-b0-73.ucode"
	doins "iwl-dbg-cfg.ini"
}
