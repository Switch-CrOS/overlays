# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="2aacb303738beffe5a274491ed38aaa5648f1dfe"
CROS_WORKON_TREE="66a94e2a4c25fbcdaf09eef934a1475729404c5b"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.6"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.6 with Skywalker private patches."
KEYWORDS="*"
