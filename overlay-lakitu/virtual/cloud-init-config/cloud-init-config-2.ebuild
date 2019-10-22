# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=6

DESCRIPTION="Virtual package for environment specific cloud-init configuration."
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-emulation/cloud-init-config-lakitu
"
