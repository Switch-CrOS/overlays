# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Any attempt to uprev kernel requires:
# 1. upload CL to merge/chromeos-5.19-manatee branch (see additional repo flag):
# repo upload . --cbr --no-verify -D merge/chromeos-5.19-manatee
# 2. update CROS_WORKON_COMMIT to reflect uploaded new CL

CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.10-manatee"
CROS_WORKON_EGIT_BRANCH="merge/chromeos-5.19-manatee"
CROS_WORKON_MANUAL_UPREV="1"
CROS_WORKON_COMMIT="5e0eeaab27240da771cdccd5f0dcd99b9be701f8"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.19-manatee"
KEYWORDS="* amd64 x86"

DEPEND="
	chromeos-base/chromeos-initramfs
"
RDEPEND=""

src_configure() {
	cros-kernel2_src_configure
	# Set the correct ROOT path in kernel config.
	sed -i "/=/s|%ROOT%|${ROOT}|" "$(get_build_cfg)"
}

src_install() {
	cros-kernel2_src_install "/build/manatee"
}
