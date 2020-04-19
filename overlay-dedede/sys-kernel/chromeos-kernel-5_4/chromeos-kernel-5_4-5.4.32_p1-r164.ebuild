# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6
CROS_WORKON_COMMIT="bc554b1a9af287ec0d3a5e27c8c017d03d0a62e9"
CROS_WORKON_TREE="a3eca4c6b42416e5e041e5c3e977804020be071d"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.4"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="dedede-specific Chrome OS Linux Kernel 5.4"
KEYWORDS="*"

IUSE="+apply_patches"
