# Copyright 2023 The Chromium OS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cros-binary modem-fw-dlc

DESCRIPTION="DLC containing the modem firmware for rex."
HOMEPAGE="http://src.chromium.org"
MIRROR_PATH="gs://chromeos-localmirror/distfiles"
SRC_URI="
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-19500.0000.00.01.02.80.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-A90.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-DEV_OTA_6000.0001.0002.0000_00.01.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-download_agent_rex_fm101-19500.0000.00.01.02.80-A90.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-OEM_OTA_6000.0000.004.tar.xz
	${MIRROR_PATH}/cellular-firmware-fibocom-fm101-OP_OTA_000.075.tar.xz"


SLOT="0"
KEYWORDS="*"
LICENSE="GPL-2 LGPL-2.1 BSD-Fibocom Apache-2.0 openssl"

S="${WORKDIR}"

# For modem FWs, this value should never increase. See modem-fw-dlc.eclass.
MODEM_FW_DLC_PREALLOC_SIZE_MB="${MODEM_FW_DLC_FM101_DEFAULT_SIZE_3FW}"

src_install() {
	modem_fw_dlc_src_install
}
