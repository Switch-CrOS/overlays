# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cros-cellular udev user

DESCRIPTION="Chrome OS Modem Update Helpers (zork)"
HOMEPAGE="http://src.chromium.org"
SRC_URI="gs://chromeos-localmirror/distfiles/cellular-firmware-zork-14067.0.0.tbz2"
LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

S="${WORKDIR}"

src_install() {
	cellular_domanifest "${FILESDIR}/helper_manifest.prototxt"

	# TODO(ejcaruso): remove these after b/71870985 is fixed and we can
	# use MBIM commands to reset the modem instead of toggling GPIOs
	insinto /etc/init/
	doins "${FILESDIR}/modemfwd-helpers.conf"

	udev_dorules "${FILESDIR}/94-l850gl-gpio.rules"

	cellular_dofirmware firmware_manifest.prototxt
	# cellular_dofirmware cannot handle this case yet
	insinto "$(_cellular_get_firmwaredir)/l850"
	doins l850/*.fls3.xz
	insinto "$(_cellular_get_firmwaredir)/nl668"
	doins -r nl668/*
}

pkg_preinst() {
	enewgroup gpio
}
