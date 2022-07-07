# Copyright 2022 The ChromiumOS Authors.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cros-cellular

DESCRIPTION="Chrome OS Modem Update Helpers (herobrine)"
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

S="${WORKDIR}"
DEPEND="chromeos-base/qc-modemfwd-helper"
RDEPEND="${DEPEND}"

src_install() {
	cellular_domanifest "${FILESDIR}/helper_manifest.prototxt"

	insinto /etc/init/
	doins "${FILESDIR}/modemfwd-helpers.conf"

	cellular_dofirmware "${FILESDIR}/firmware_manifest.prototxt"

	# fw is loaded to the image using src/private-overlays/baseboard-herobrine-private/chromeos-base/sc7280-modem-firmware/
}
