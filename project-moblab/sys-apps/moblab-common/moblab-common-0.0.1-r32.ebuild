# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="81eea15a09869fddbefad8c87997f1e65fb05180"
CROS_WORKON_TREE="a12ca39dc4564f648843b7449c46bd9f6aa7b7c1"
CROS_WORKON_PROJECT="chromiumos/platform/moblab"
CROS_WORKON_LOCALNAME="../platform/moblab"

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )

inherit cros-workon distutils-r1

IUSE="docker"
DESCRIPTION="Install moblab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/moblab/+/master/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="virtual/python-futures"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		${RDEPEND}"

