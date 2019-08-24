# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=6

CROS_WORKON_COMMIT="471a9fe31d3132080525f8f269ba64920e360577"
CROS_WORKON_TREE="f9b35a282b78b7c32bfcc7dc9b3acda7ea15d0a2"
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
