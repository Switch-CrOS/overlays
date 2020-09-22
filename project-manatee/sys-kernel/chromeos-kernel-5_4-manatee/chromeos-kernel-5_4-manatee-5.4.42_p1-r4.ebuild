# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="3111fd8c1bfef469c730d543fa2a0f74100bb3c4"
CROS_WORKON_TREE="47ad1bae5646f28a25685ed7d7eb7788cfa8f38b"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4-manatee"
CROS_WORKON_EGIT_BRANCH="chromeos-5.4-manatee"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.4-manatee"
KEYWORDS="* amd64 x86 arm64"

DEPEND="
	chromeos-base/chromeos-initramfs
"
RDEPEND=""

src_configure() {
	local cfgarch="$(get_build_arch)"
	CHROMEOS_KERNEL_CONFIG="${FILESDIR}/defconfig.${cfgarch}" \
		cros-kernel2_src_configure
	# Set the correct ROOT path in kernel config.
	sed -i "/=/s|%ROOT%|${ROOT}|" "$(get_build_cfg)"
}

src_install() {
	if use buildtest ; then
		ewarn "Skipping install for buildtest"
		return 0
	fi
	local boot_dir=boot/hv
	dodir /${boot_dir}
	kmake INSTALL_MOD_PATH="${D}/${boot_dir}/modules" INSTALL_PATH="${D}/${boot_dir}" install
	local version=$(kernelrelease)
	if [ ! -e "${D}/${boot_dir}/vmlinuz" ]; then
		ln -sf "vmlinuz-${version}" "${D}/${boot_dir}/vmlinuz" || die
	fi
}
