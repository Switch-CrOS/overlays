# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="NVIDIA L4T proprietary graphics userspace and Switch wireless firmware"
HOMEPAGE="https://repo.download.nvidia.com/jetson/"
LICENSE="NVIDIA-r2"
SLOT="0"
KEYWORDS="-* arm64"
IUSE=""
RESTRICT="mirror strip binchecks bindist"

L4T_VERSION="32.7.4-20230608212426"
L4T_323_FIRMWARE_VERSION="32.3.1-20191209225816"
L4T_327_FIRMWARE_VERSION="32.7.4-20230608212426"
NVIDIA_REPO="https://repo.download.nvidia.com/jetson/t210/pool/main/n"
L4T_DEBS_REPO="https://raw.githubusercontent.com/theofficialgman/l4t-debs/refs/heads/main/pool"
SRC_URI="
	${NVIDIA_REPO}/nvidia-l4t-core/nvidia-l4t-core_${L4T_VERSION}_arm64.deb -> nvidia-l4t-core_${L4T_VERSION}_arm64.deb
	${NVIDIA_REPO}/nvidia-l4t-3d-core/nvidia-l4t-3d-core_${L4T_VERSION}_arm64.deb -> nvidia-l4t-3d-core_${L4T_VERSION}_arm64.deb
	${NVIDIA_REPO}/nvidia-l4t-init/nvidia-l4t-init_${L4T_VERSION}_arm64.deb -> nvidia-l4t-init_${L4T_VERSION}_arm64.deb
	${L4T_DEBS_REPO}/main/n/nvidia-l4t-firmware/nvidia-l4t-firmware_${L4T_323_FIRMWARE_VERSION}_arm64.deb -> nvidia-l4t-firmware_${L4T_323_FIRMWARE_VERSION}_arm64.deb
	${L4T_DEBS_REPO}/main-32-7/n/nvidia-l4t-firmware/nvidia-l4t-firmware_${L4T_327_FIRMWARE_VERSION}_arm64.deb -> nvidia-l4t-firmware_${L4T_327_FIRMWARE_VERSION}_arm64.deb
"

# libglvnd provides the EGL/GLES/GL/GLX dispatcher SONAMEs (libEGL.so.1 etc.)
# that read /usr/share/glvnd/egl_vendor.d/*.json and route calls to vendor
# ICDs.  NVIDIA's vendor ICDs (libEGL_nvidia.so.0, libGLX_nvidia.so.0, etc.)
# require libglvnd's __egl_Main / __glx_Main handshake to populate their
# internal visual / config tables — without it, eglInitialize fails with
# "Invalid visual ID requested" because the vendor's visual tables stay
# empty.  Mesa is pulled in transitively as libglvnd's other vendor ICD;
# the overlay's profiles/base/package.use sets USE=libglvnd on it so Mesa
# installs as libEGL_mesa.so.0 instead of colliding with libglvnd at
# /usr/lib64/libEGL.so.1.
RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libdrm
	media-libs/libglvnd
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/root

src_unpack() {
	mkdir -p "${S}" || die
	cd "${S}" || die
	unpack_deb "${DISTDIR}/nvidia-l4t-core_${L4T_VERSION}_arm64.deb" || die
	unpack_deb "${DISTDIR}/nvidia-l4t-3d-core_${L4T_VERSION}_arm64.deb" || die
	# nvidia-l4t-init brings systemd units, scripts, and config we don't
	# want — extract only the udev rules out of it.
	local init_root="${WORKDIR}/l4t-init"
	mkdir -p "${init_root}" || die
	pushd "${init_root}" >/dev/null || die
	unpack_deb "${DISTDIR}/nvidia-l4t-init_${L4T_VERSION}_arm64.deb" || die
	popd >/dev/null || die
	unpack_deb "${DISTDIR}/nvidia-l4t-firmware_${L4T_323_FIRMWARE_VERSION}_arm64.deb" || die
	unpack_deb "${DISTDIR}/nvidia-l4t-firmware_${L4T_327_FIRMWARE_VERSION}_arm64.deb" || die
}

src_install() {
	dodir /usr/lib/aarch64-linux-gnu /usr/lib/xorg/modules /usr/share/glvnd/egl_vendor.d /etc/vulkan/icd.d /lib/firmware /usr/sbin

	cp -a "${S}"/usr/lib/aarch64-linux-gnu/tegra "${D}"/usr/lib/aarch64-linux-gnu/ || die
	cp -a "${S}"/usr/lib/aarch64-linux-gnu/tegra-egl "${D}"/usr/lib/aarch64-linux-gnu/ || die
	cp -a "${S}"/usr/lib/xorg/modules/drivers "${D}"/usr/lib/xorg/modules/ || die
	cp -a "${S}"/usr/lib/xorg/modules/extensions "${D}"/usr/lib/xorg/modules/ || die
	cp -a "${S}"/usr/share/glvnd/egl_vendor.d/. "${D}"/usr/share/glvnd/egl_vendor.d/ || die
	cp -a "${S}"/etc/vulkan/icd.d/. "${D}"/etc/vulkan/icd.d/ || die
	cp -a "${S}"/lib/firmware/brcm "${D}"/lib/firmware/ || die
	cp -a "${S}"/lib/firmware/bcm4354.hcd "${D}"/lib/firmware/ || die
	cp -a "${S}"/lib/firmware/gm20b "${D}"/lib/firmware/ || die
	cp -a "${S}"/lib/firmware/tegra21x "${D}"/lib/firmware/ || die
	exeinto /usr/sbin
	doexe "${S}"/usr/sbin/brcm_patchram_plus

	# Install L4T udev rules so /dev/nv*, /dev/tegra_dc_*, etc. get
	# permissive group access at creation time.  Without these, the
	# Tegra kernel module creates them as root:root mode 0600, which
	# makes NVIDIA's libEGL fault on first device-node open (it doesn't
	# handle EACCES gracefully and the GPU process segfaults).
	insinto /etc/udev/rules.d
	doins "${WORKDIR}"/l4t-init/etc/udev/rules.d/*.rules

	# NVIDIA's vendor ICDs in tegra-egl/ load libnvidia-eglcore,
	# libnvidia-glsi, libnvrm*, etc. from tegra/ via DT_NEEDED, so both
	# directories must be on the dynamic linker's search path.  Gentoo's
	# env-update generates /etc/ld.so.conf from /etc/env.d/ fragments and
	# ignores /etc/ld.so.conf.d/ entirely, so the LDPATH must go through
	# env.d to take effect.
	insinto /etc/env.d
	newins - 50nvidia-tegra <<-EOF
		LDPATH="/usr/lib/aarch64-linux-gnu/tegra-egl:/usr/lib/aarch64-linux-gnu/tegra"
	EOF
}

pkg_postinst() {
	# Regenerate /etc/ld.so.conf + /etc/profile.env from /etc/env.d/.
	# Skip the cache rebuild: the chroot's x86_64 ldconfig can't read
	# AArch64 ELFs ("unknown machine 183"), and build_image runs a
	# target-aware ldconfig at image finalization.
	env-update --no-ldconfig || die
}
