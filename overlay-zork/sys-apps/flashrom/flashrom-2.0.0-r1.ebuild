# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Hack to disable flashrom on zork"
HOMEPAGE="http://flashrom.org/"
#SRC_URI="http://download.flashrom.org/releases/${P}.tar.bz2"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/0"
KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND=""
BDEPEND=""

src_unpack() {
	# Portage expects a work dir is created
	mkdir "${P}"
}

src_install() {
	dosbin "${FILESDIR}/flashrom"
}
