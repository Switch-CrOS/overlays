# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="db867ccf596a910b85bab8c6052afe59fa921727"
CROS_WORKON_TREE="da2bd1779a5fc47f4289c0d6c5bf5340890d1dcc"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.6"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.6 with Skywalker private patches."
KEYWORDS="*"
