# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=7

CROS_WORKON_COMMIT="1144e8f431c5645d6b6b79dc6f61d7b24b4d1044"
CROS_WORKON_TREE="99ad4588db09aa074356fb2d56f1dfe7fd0eee7f"
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

RDEPEND="dev-python/future[${PYTHON_USEDEP}]"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		${RDEPEND}"

