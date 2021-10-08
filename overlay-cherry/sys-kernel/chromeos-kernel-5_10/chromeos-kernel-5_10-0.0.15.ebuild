# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="13e81dbbd781d82b3cf7ee384ca2cb9e99afecce"
CROS_WORKON_TREE="41fb496ea32f7cc29c0cb9b8187b1346d86cfeeb"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.10"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.10"
KEYWORDS="*"
