# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6
CROS_WORKON_COMMIT="1d74b5a6fa2a79e25da5ed265bce824e796eaf93"
CROS_WORKON_TREE="4d096b1d0866dbb9f1e0193450c158f3dd796ace"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="dedede-specific Chrome OS Linux Kernel 5.4"
KEYWORDS="*"

IUSE="+apply_patches"
