# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs unpacker

DESCRIPTION="MediaTek camera debug binaries and imgsys library binaries required by the MediaTek camera HAL"
SRC_URI="gs://chromeos-localmirror/distfiles/${P}.tar.xz"

LICENSE="LICENCE.mediatek"
SLOT="0"
KEYWORDS="-* arm arm64"

S="${WORKDIR}"

src_install() {
	dolib.so "${PN}"/*.so*
	dobin "${PN}"/hwcore_setprop
	dobin "${PN}"/hwcore_getprop
	dobin "${PN}"/mtkBackend_ut
	dobin "${PN}"/camsys_dump_tool
}
