# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="0f1adb5ec81701b269bc59d01e1015692d8f5f88"
CROS_WORKON_TREE="e87b38ae3679224fb3c214781daf5605ee368f6f"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v5.15"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 5.15 with Corsola private patches."
KEYWORDS="*"
