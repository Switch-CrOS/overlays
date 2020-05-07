# Copyright (C) 2012 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI="4"
CROS_WORKON_COMMIT="5e490eff78617bdf8fd406f6f339149d5e1485d8"
CROS_WORKON_TREE="c057cae0fcde239762e56b676cfda54c1d07ad84"
CROS_WORKON_PROJECT="chromiumos/platform/ec"
CROS_WORKON_LOCALNAME="../platform/ec"

inherit cros-workon

DESCRIPTION="Temporary metrics collection of sensor temperatures"
HOMEPAGE="http://www.chromium.org/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	chromeos-base/ec-utils
	sys-apps/iotools
"

src_compile() {
	:
}

src_install() {
	insinto "/etc/init"
	doins "util/temp_metrics.conf"
}
