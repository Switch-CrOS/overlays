# Copyright 2021 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="SOF topology files for Brask"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-brask-${PV}.tar.bz2"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

S=${WORKDIR}/${PN}-brask-${PV}

src_install() {
	insinto /lib/firmware/intel/sof-tplg
	doins ./*.tplg

	# Add symlinks for all tplg files to RPL ones with name replacing prefix to "sof-rpl"
	for TPLG_FILE in ./*.tplg ; do
		dosym "${TPLG_FILE}" /lib/firmware/intel/sof-tplg/"${TPLG_FILE//sof-adl/sof-rpl}"
	done
}
