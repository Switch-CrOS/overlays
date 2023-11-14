# Copyright 2021 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2.

EAPI="7"

CROS_WORKON_COMMIT="1306e29cedac927c40afd1ab8735647d8c430186"
CROS_WORKON_TREE="1a12d34b7c238b2c803f8fffa99fcab964cef801"
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
