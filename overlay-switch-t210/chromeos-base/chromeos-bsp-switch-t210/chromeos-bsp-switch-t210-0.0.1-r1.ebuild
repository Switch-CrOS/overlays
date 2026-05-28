# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-workon

DESCRIPTION="Nintendo Switch T210 ChromiumOS BSP payloads"
LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT="mirror"

KERNEL_RELEASE="https://github.com/Switch-CrOS/l4t-kernel-build-scripts/releases/download/r1"
UBOOT_RELEASE="https://github.com/Switch-CrOS/u-boot/releases/download/r2"
# broken somehow
#ATF_RELEASE="https://github.com/Switch-CrOS/switch-atf/releases/download/r1"
ATF_RELEASE="https://gitlab.com/l4t-community/gnu-linux/switchroot-pipeline/-/raw/13d157573875b4fab294cb4e2db90e724176a8dc/scripts/bootloader/assets"
INITRAMFS_RELEASE="https://raw.githubusercontent.com/theofficialgman/l4t-debs-source/1fdfc9b576c5eed02e181be7b24a7a3edb98cebc/deb_package_sources/noble/switch-bsp/opt/switchroot/bootstack/initramfs"

SRC_URI="
	${KERNEL_RELEASE}/uImage -> uImage
	${KERNEL_RELEASE}/modules.tar.gz -> modules.tar.gz
	${KERNEL_RELEASE}/nx-plat.dtimg -> nx-plat.dtimg
	${UBOOT_RELEASE}/bl33.bin -> bl33.bin
	${ATF_RELEASE}/bl31.bin -> bl31.bin
	${INITRAMFS_RELEASE} -> initramfs
"

src_install() {
	doappid "{5A0F1D80-89A2-4B16-A6F7-0E9C7F1C0210}" "OTHER"

	insinto /usr/share/switch-t210/bootstack
	doins "${DISTDIR}"/uImage
	doins "${DISTDIR}"/nx-plat.dtimg
	doins "${DISTDIR}"/initramfs
	doins "${FILESDIR}"/boot.scr
	doins "${DISTDIR}"/bl31.bin
	doins "${DISTDIR}"/bl33.bin
	doins "${FILESDIR}"/README_CONFIG.txt
	doins "${FILESDIR}"/switch-t210.ini
	doins "${FILESDIR}"/icon_chromiumos_hue.bmp
	doins "${FILESDIR}"/bootlogo_chromiumos.bmp

	insinto /etc
	doins "${FILESDIR}"/switchroot_version.conf

	exeinto /usr/sbin
	doexe "${FILESDIR}"/switch-debug/sbin/switch-log-snapshot
	doexe "${FILESDIR}"/switch-debug/sbin/switch-logkeeper

	insinto /etc/init
	doins "${FILESDIR}"/switch-debug/init/*.conf

	mkdir -p "${WORKDIR}/l4t-root"
	tar -C "${WORKDIR}/l4t-root" -xzf "${DISTDIR}"/modules.tar.gz
	dodir /lib
	cp -a "${WORKDIR}/l4t-root/modules" "${D}/lib/"
	dodir /lib/firmware
	rm -r "${WORKDIR}/l4t-root/firmware/keyspan" # conflicts
	cp -a "${WORKDIR}/l4t-root/firmware/"* "${D}/lib/firmware/"
	keepdir /boot
}
