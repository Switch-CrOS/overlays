# Copyright 2022 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=6

DESCRIPTION="Alder Lake SOF firmware binary"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-adln-${PV}.tar.bz2"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

RDEPEND="
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-adln-${PV}

src_install() {
	insinto /lib/firmware/intel/sof/community
	doins sof-adl.ri
	doins sof-adl.ldc
	dodoc README
}
