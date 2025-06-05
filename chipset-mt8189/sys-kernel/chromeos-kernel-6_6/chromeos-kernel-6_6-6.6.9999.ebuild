# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="a719db6f7dc05dcd4c62b7f904f0968f3b4b13af"
CROS_WORKON_TREE="8f01e804976aea341ccab08cf1c82c4685516d47"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.6"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.6 with Skywalker private patches."
KEYWORDS="*"
