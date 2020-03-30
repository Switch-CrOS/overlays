# Copyright (C) 2012 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI="4"
CROS_WORKON_COMMIT="967a74dc60d6f1eb76c62e4c8736dd1b1372f522"
CROS_WORKON_TREE="0c1fd3119f7f91640dbb0b70a3bda2adcc6d3f88"
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
