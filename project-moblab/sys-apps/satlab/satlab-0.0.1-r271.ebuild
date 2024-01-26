# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="7ac6c164b918848509c9a5d762863a4b9fe0e0fc"
CROS_WORKON_TREE="39f34f96bcbf05f48b07f4d20182329a50834232"
PYTHON_COMPAT=( python3_{8..11} )

CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/satlab"
CROS_WORKON_LOCALNAME="../platform/satlab"

inherit cros-workon python-single-r1

DESCRIPTION="Install satlab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/satlab/+/main/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	app-emulation/docker
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/grpcio[${PYTHON_USEDEP}]
		dev-python/protobuf-python[${PYTHON_USEDEP}]
		' -3)
	net-firewall/iptables
"

DEPEND="${RDEPEND}
"
