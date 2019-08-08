# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=5

inherit linux-mod

DESCRIPTION="Google Virtual Ethernet (gve) driver"
HOMEPAGE="https://github.com/GoogleCloudPlatform/compute-virtual-ethernet-linux"
LICENSE="MIT GPL-2"
# We use EGIT_COMMIT to pick up the special (backported) release for COS,
# instead of the raw source tarball.
EGIT_COMMIT="a71d3d14d7417e37aec33a55e96d4bfec617bddb"

# Note: the tarball should be stored at gs://chromeos-localmirror-private/distfiles/
SRC_URI="https://github.com/GoogleCloudPlatform/compute-virtual-ethernet-linux/releases/download/v0.0.1/gve-${EGIT_COMMIT}-cos.tar.gz -> gve-${EGIT_COMMIT}-cos.tar.gz"

SLOT="0"

KEYWORDS="*"

COMMON=""
DEPEND="
	${COMMON}
	virtual/linux-sources
"
RDEPEND="
	${COMMON}"

S="${WORKDIR}"

# Because our kernel version string ends with '+' (e.g.  # "4.4.21+"), Gentoo
# Linux's linux-info.eclass cannot locate the kernel build output directory.
KBUILD_OUTPUT=${KERNEL_DIR}/build

BUILD_PARAMS="CONFIG_GVE=m"
BUILD_PARAMS+=" CC=${CC} -C ${KBUILD_OUTPUT}"
BUILD_PARAMS+=" M=${S}"
BUILD_TARGETS="modules"
MODULE_NAMES="
	gve(extra_modules:${S})"

src_install() {
	linux-mod_src_install
	insinto /usr/lib/modules-load.d
	doins "${FILESDIR}/gve.conf"
	insinto /usr/lib/systemd/network
	doins "${FILESDIR}/70-gve.network"
}
