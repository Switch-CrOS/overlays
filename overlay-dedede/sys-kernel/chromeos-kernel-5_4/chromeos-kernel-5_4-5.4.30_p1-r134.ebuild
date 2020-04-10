# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6
CROS_WORKON_COMMIT="9b2572fd435e03af53a4805bb2989ab6c8d9425c"
CROS_WORKON_TREE="2c46e35907dde69813a626ecba0894f9d405bf89"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="dedede-specific Chrome OS Linux Kernel 5.4"
KEYWORDS="*"

IUSE="+apply_patches"
