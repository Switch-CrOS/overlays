# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=6

DESCRIPTION="Configuration of cloud-init for lakitu"
HOMEPAGE=""

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="app-emulation/cloud-init"
RDEPEND="
	${DEPEND}
	!<app-emulation/cloud-init-0.7.6-r27
"

S=${WORKDIR}

src_install() {
	insinto /etc/cloud
	doins "${FILESDIR}"/cloud.cfg
}

