# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_TARBALL_SUFFIX="xz"
inherit xorg-3

DESCRIPTION="X.Org input driver based on libinput"
KEYWORDS="-* arm64"
RESTRICT="mirror"

XORG_CONFIGURE_OPTIONS=(
	--with-xorg-module-dir=/usr/lib/xorg/modules
)

RDEPEND="dev-libs/libinput"
DEPEND="${RDEPEND}"
