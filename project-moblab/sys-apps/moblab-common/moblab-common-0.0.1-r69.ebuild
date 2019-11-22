# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=7

CROS_WORKON_COMMIT="ebbfe608bddf2145ed9773f4ee495630ceefcb13"
CROS_WORKON_TREE="bb466d6c113a854a93e2324f4c111d797d4b8bc7"
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

