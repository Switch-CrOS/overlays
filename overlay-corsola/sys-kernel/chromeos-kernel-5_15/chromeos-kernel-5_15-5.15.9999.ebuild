# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="ddc1400c97bd73a843e1802003ab6e3117e033f1"
CROS_WORKON_TREE="6790ccc37c995357cdf24066d8de0c7b814b2b74"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.15"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.15 with Corsola private patches."
KEYWORDS="*"
