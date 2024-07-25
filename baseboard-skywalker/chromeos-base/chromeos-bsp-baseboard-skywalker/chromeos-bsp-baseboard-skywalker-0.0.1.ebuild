# Copyright 2024 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
EAPI=7

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."
HOMEPAGE=""
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
S="${WORKDIR}"
IUSE=""

#Add dependencies on other ebuilds from within this board overlay
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
