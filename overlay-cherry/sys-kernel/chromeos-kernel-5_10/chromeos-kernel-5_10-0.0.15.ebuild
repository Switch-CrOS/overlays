# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="4b149df5a4b42ae7130cb3c479f759a41ea9e10c"
CROS_WORKON_TREE="69543a1d24f183c96517f392e6bbf51ea6a2a749"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.10"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.10"
KEYWORDS="*"
