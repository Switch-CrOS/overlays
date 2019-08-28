# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="abe1db72aefcca05e5f7c8e2e4a9ac4cad8ce5ed"
CROS_WORKON_TREE="d8786efb90efd02fd7a1f488513d39cbf014d369"
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

SRC_URI="${BASE_SRC_URI}/mobmonitor-ui-node_modules-0.0.2.tar.gz"

RDEPEND="
		docker? ( app-emulation/docker )
		dev-python/futures
		dev-python/google-cloud-storage
		dev-python/grpcio
		dev-python/protobuf-python
		net-libs/grpc
		app-admin/logrotate
		dev-python/parallel-ssh
		sys-apps/moblab-common
"

DEPEND="${RDEPEND}
"

src_unpack() {
	cros-workon_src_unpack
	default
}
