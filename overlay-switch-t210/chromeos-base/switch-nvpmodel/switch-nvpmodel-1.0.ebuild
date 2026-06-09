# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="NVIDIA nvpmodel power-profile manager + Nintendo Switch (Tegra X1) configs"
HOMEPAGE="https://docs.nvidia.com/jetson/archives/l4t-archived/"

# Prebuilt NVIDIA L4T aarch64 blob + NVIDIA-authored configs, same license as
# the rest of the L4T userspace we ship.
LICENSE="NVIDIA-r2"
SLOT="0"
KEYWORDS="-* arm64"
IUSE=""

# Prebuilt binary: don't strip it, skip the host binary-QA checks (it wasn't
# built with the CrOS toolchain), and mark it redistributable.
RESTRICT="strip binchecks bindist"

# Everything ships from ${FILESDIR}; nothing to fetch or build.
S="${WORKDIR}"

src_install() {
	# nvpmodel binary (prebuilt L4T aarch64, needs only libc.so.6).
	dosbin "${FILESDIR}/nvpmodel"

	# Power-model configs (Erista Tegra210 + Mariko Tegra210B01) and the
	# charge-limit models.  The boot job picks the SoC-appropriate one via -f.
	insinto /etc/nvpmodel
	doins "${FILESDIR}/nvpmodel_t210.conf"
	doins "${FILESDIR}/nvpmodel_t210b01.conf"
	doins "${FILESDIR}/nvpmodel_charging.conf"

	# Upstart job: SoC-aware conf selection, apply the default mode, plus the
	# CrOS-relevant nv.sh sysfs tweaks.
	insinto /etc/init
	doins "${FILESDIR}/nvpmodel.conf"

	# tmpfiles.d config that creates nvpmodel's /var/lib/nvpmodel state dir
	# (referenced by the upstart job's `tmpfiles` stanza).
	insinto /usr/lib/tmpfiles.d
	newins "${FILESDIR}/nvpmodel-tmpfiles.conf" nvpmodel.conf
}
