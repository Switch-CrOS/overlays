# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cros-cellular udev user

DESCRIPTION="Chrome OS Modem Update Helpers (drallion)"
HOMEPAGE="http://src.chromium.org"
SRC_URI="gs://chromeos-localmirror/distfiles/cellular-firmware-drallion-13045.0.0.tbz2"
LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

S="${WORKDIR}"
DEPEND="
	chromeos-base/fibocom-firmware
"
RDEPEND="${DEPEND}"

src_install() {
	cellular_domanifest "${FILESDIR}/helper_manifest.prototxt"

	# TODO(ejcaruso): remove these after b/71870985 is fixed and we can
	# use MBIM commands to reset the modem instead of toggling GPIOs
	insinto /etc/init/
	doins "${FILESDIR}/modemfwd-helpers.conf"

	udev_dorules "${FILESDIR}/94-l850gl-gpio.rules"

	# TODO(ejcaruso): remove these after the component updater service
	# handles the LTE firmware bundle better, b/74250103
	cellular_dofirmware *.fls3.xz
	cellular_dofirmware firmware_manifest.prototxt
}

pkg_preinst() {
	enewgroup gpio
}
