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

RDEPEND="
	x11-base/xorg-server
	x11-drivers/xf86-input-libinput
	x11-drivers/xf86-video-fbdev
	x11-drivers/nvidia-l4t-userspace
	tpm2_simulator? ( chromeos-base/tpm2-simulator )
	media-libs/switch-alsa-ucm2
	chromeos-base/switch-nvpmodel
"
IUSE="+tpm2_simulator"

# initramfs-patch.sh uses mkimage (from u-boot-tools) to rewrap the
# patched cpio in a U-Boot legacy uImage header.  cpio/gzip/dd are in
# system, no explicit dep.
BDEPEND="dev-embedded/u-boot-tools"

KERNEL_RELEASE="https://github.com/Switch-CrOS/l4t-kernel-build-scripts/releases/download/r2"
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

	# patch the initramfs for various things
	local patched_initramfs="${T}/initramfs"
	"${FILESDIR}/initramfs-patch.sh" \
		"${DISTDIR}/initramfs" "${patched_initramfs}" || die
	doins "${patched_initramfs}"
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

	# Switch X11 fbdev display stack (used in place of ChromeOS's ozone/drm
	# path because L4T 4.9 exposes /dev/fb0 but no DRM/KMS node).
	exeinto /sbin
	doexe "${FILESDIR}"/switch-xorg-fbdev
	dosym /sbin/switch-xorg-fbdev /usr/local/bin/switch-xorg-fbdev
	insinto /etc/init
	doins "${FILESDIR}"/switch-xorg-fbdev.conf

	# Disable upstream services that abort-loop without Switch-specific
	# hardware/drivers (no DLC delivery).
	# Each .override file contains `manual`, which inhibits the job's
	# automatic start condition without needing to patch the upstream .conf.
	#
	# NB: trunksd/tpm_managerd are intentionally NOT disabled — the Switch
	# runs the userspace TPM2 simulator (USE=tpm2_simulator) so the full
	# hwsec stack works.  See profiles/base/make.defaults.
	insinto /etc/init
	doins "${FILESDIR}"/udev-trigger.override
	doins "${FILESDIR}"/dlcservice.override
	# Suppress bring-up noise: intentional crash generator, boot-splash's
	# frecon launch (no DRM/KMS on L4T 4.9), unprimed boot-IO optimizer,
	# and auditd respawn loop.
	doins "${FILESDIR}"/early-failure.override
	doins "${FILESDIR}"/boot-splash.override
	doins "${FILESDIR}"/ureadahead.override
	# Must accompany ureadahead.override: with ureadahead disabled,
	# 'stopped ureadahead' never fires, so this job's compound start
	# condition holds the 'starting boot-complete' event forever and
	# wedges the whole system-services tier.  See the override file.
	doins "${FILESDIR}"/ureadahead-corruption-check.override
	doins "${FILESDIR}"/auditd.override

	# Bring-up concession flags read by chromeos_startup:
	#  * disable_stateful_security_hardening — L4T 4.9 lacks the ChromeOS
	#    inode security policy LSM hooks under
	#    /sys/kernel/security/chromiumos/inode_security_policies; skip
	#    stateful symlink/FIFO hardening so startup doesn't try to program
	#    nonexistent sysfs nodes.
	#  * disable_stateful_self_repair — tmpfiles failures are tolerated
	#    during bring-up instead of triggering an automatic re-image.
	dodir /usr/share/cros/startup
	touch "${D}/usr/share/cros/startup/disable_stateful_security_hardening" \
		|| die
	touch "${D}/usr/share/cros/startup/disable_stateful_self_repair" \
		|| die
	fperms 0644 \
		/usr/share/cros/startup/disable_stateful_security_hardening \
		/usr/share/cros/startup/disable_stateful_self_repair

	mkdir -p "${WORKDIR}/l4t-root"
	tar -C "${WORKDIR}/l4t-root" -xzf "${DISTDIR}"/modules.tar.gz
	dodir /lib
	cp -a "${WORKDIR}/l4t-root/modules" "${D}/lib/"
	dodir /lib/firmware
	rm -r "${WORKDIR}/l4t-root/firmware/keyspan" # conflicts
	cp -a "${WORKDIR}/l4t-root/firmware/"* "${D}/lib/firmware/"
	keepdir /boot
}
