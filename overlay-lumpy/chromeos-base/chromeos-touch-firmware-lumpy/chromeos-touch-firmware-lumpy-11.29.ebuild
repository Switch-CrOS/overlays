# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Ebuild that installs the chromeos touchpad firmware payload."
# TODO: Drop the -r# in the next release and update $PV instead.
# And keep the $PV in sync with the ebuild (to use here).
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-11.27-r2.tbz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}
	chromeos-base/touch_updater"

PRODUCT_ID="CYTRA-116001-00"

FW_NAME="${PRODUCT_ID}_11.27.bin"
SYM_LINK_PATH="/lib/firmware/cyapa.bin"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r */*

	# Create symlink at /lib/firmware to the firmware binary.
	dosym "/opt/google/touch/firmware/${FW_NAME}" "${SYM_LINK_PATH}"
}
