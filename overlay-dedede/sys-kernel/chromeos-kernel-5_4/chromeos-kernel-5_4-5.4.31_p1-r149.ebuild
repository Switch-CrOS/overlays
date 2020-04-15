# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6
CROS_WORKON_COMMIT="189796473f353d9f850f574078ed9d49bba26b7e"
CROS_WORKON_TREE="8fc2db382262bdf641ca89605f01fd6a03f25d98"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="dedede-specific Chrome OS Linux Kernel 5.4"
KEYWORDS="*"

IUSE="+apply_patches"
