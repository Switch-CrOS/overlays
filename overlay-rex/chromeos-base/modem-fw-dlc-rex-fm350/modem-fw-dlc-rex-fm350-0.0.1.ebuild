# Copyright 2023 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cros-binary modem-fw-dlc

DESCRIPTION="DLC containing the modem firmware for rex_fm350."
HOMEPAGE="http://src.chromium.org"
MIRROR_PATH="gs://chromeos-localmirror/distfiles"
SRC_URI="
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-81600.0000.00.29.23.06.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-FM350.F09.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-DEV_OTA_6003.0000.0000_Default_001.000.000.000.img.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-OP_OTA_302.005.img.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm350-OEM_OTA_6003.0002.015.img.tar.xz
	"

SLOT="0"
KEYWORDS="*"
LICENSE="BSD-Google" #TODO(b/203807072): Change once Fibocom provides a license

S="${WORKDIR}"

# For modem FWs, this value should never increase. See modem-fw-dlc.eclass.
MODEM_FW_DLC_PREALLOC_SIZE_MB="${MODEM_FW_DLC_FM350_DEFAULT_SIZE_3FW}"

src_install() {
	modem_fw_dlc_src_install
}
