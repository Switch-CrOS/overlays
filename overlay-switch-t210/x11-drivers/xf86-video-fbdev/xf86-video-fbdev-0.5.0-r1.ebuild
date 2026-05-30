# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xorg-3

DESCRIPTION="X.Org driver for Linux framebuffer devices"
KEYWORDS="-* arm64"
RESTRICT="mirror"

XORG_CONFIGURE_OPTIONS=(
	--with-xorg-module-dir=/usr/lib/xorg/modules
)
