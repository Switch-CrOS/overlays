# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="1118b8c141a5e565ccd7f3898319f83a86346cee"
CROS_WORKON_TREE="91063e35d6e06830a88b3832d7aa3a56730f5f51"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.6"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.6 with Skywalker private patches."
KEYWORDS="*"
