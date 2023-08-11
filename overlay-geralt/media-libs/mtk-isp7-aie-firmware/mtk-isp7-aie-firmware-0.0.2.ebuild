# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs unpacker

DESCRIPTION="MediaTek AIE firmware required by the MediaTek camera HAL"
SRC_URI="gs://chromeos-localmirror/distfiles/${P}.tar.xz"

LICENSE="LICENCE.mediatek"
SLOT="0"
KEYWORDS="-* arm arm64"

S="${WORKDIR}"

src_install() {
	insinto /lib/firmware/aie_mp_fw31/config
	doins "${PN}"/aie_mp_fw31/config/*.bin
	insinto /lib/firmware/aie_mp_fw31/kernel
	doins "${PN}"/aie_mp_fw31/kernel/*.bin
}
