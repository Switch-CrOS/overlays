# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="5e165e57eceebc6f133695f4a3e2d11ae5e4cb02"
CROS_WORKON_TREE="b6e2dcdf06f04aed33e6ea1147fe51d35f6b7a4c"
CROS_WORKON_INCREMENTAL_BUILD=1
CROS_WORKON_OUTOFTREE_BUILD=1
CROS_WORKON_PROJECT="chromiumos/platform/moblab"
CROS_WORKON_LOCALNAME="../platform/moblab"

inherit cros-workon

DESCRIPTION="Install moblab, a test scheduling infrastructure"
HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/moblab/+/master/src/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE="docker"

SRC_URI="${BASE_SRC_URI}/mobmonitor-ui-node_modules-0.0.2.tar.gz
		${BASE_SRC_URI}/moblab-ui-node_modules-0.0.1.tar.gz"
RDEPEND="
		app-admin/logrotate
		app-emulation/docker
		dev-python/cherrypy
		dev-python/futures
		dev-python/google-cloud-storage
		dev-python/google-cloud-pubsub
		dev-python/grpcio
		dev-python/parallel-ssh
		dev-python/protobuf-python
		net-libs/grpc
		sys-apps/moblab-common
		net-dialup/minicom
"

DEPEND="${RDEPEND}
"

src_unpack() {
	cros-workon_src_unpack
	default
}
