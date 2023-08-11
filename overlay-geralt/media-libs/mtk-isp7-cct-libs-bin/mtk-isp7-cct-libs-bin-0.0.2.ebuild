# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs unpacker

DESCRIPTION="MediaTek tuning tool binaries required by the MediaTek camera HAL"
SRC_URI="gs://chromeos-localmirror/distfiles/${P}.tar.xz"

LICENSE="LICENCE.mediatek"
SLOT="0"
KEYWORDS="-* arm arm64"

S="${WORKDIR}"

src_install() {
	dobin "${PN}"/camtool2
	dobin "${PN}"/cct_camera
}
