# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=5

inherit linux-mod

DESCRIPTION="Google Virtual Ethernet (gve) driver"
HOMEPAGE="https://github.com/GoogleCloudPlatform/compute-virtual-ethernet-linux"
LICENSE="MIT GPL-2"

SRC_URI="https://github.com/GoogleCloudPlatform/compute-virtual-ethernet-linux/releases/download/v1.0.0/gve-${PV}-cos.tar.gz -> gve-${PV}-cos.tar.gz"

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
