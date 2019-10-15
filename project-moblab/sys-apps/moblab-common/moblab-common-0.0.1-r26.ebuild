# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="9f255ea0418a1b273fbf59b59c1ec166cf3698e8"
CROS_WORKON_TREE="4a6838943fbbd8a99af90a58e11d4e13d35a4f39"
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

RDEPEND=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		${RDEPEND}"

