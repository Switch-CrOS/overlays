# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="dbbd2132bdf96fc20ed6f50c9e77f429378b782a"
CROS_WORKON_TREE="4fb7baa9dbb2d0b6449acea21211516a69987db7"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.15"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.15 with Corsola private patches."
KEYWORDS="*"
