# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# x.org ships recent app releases as .tar.xz; xorg-3 auto-derives SRC_URI as
# .../releases/individual/app/xrandr-${PV}.tar.xz for the x11-apps category.
XORG_TARBALL_SUFFIX="xz"

inherit xorg-3

DESCRIPTION="Command line interface to the X11 RandR extension (display output control)"
KEYWORDS="-* arm64"
IUSE=""
RESTRICT="mirror"

# All deps are already built for switch-t210 (pulled in by the Xorg/Chrome
# stack): libX11, libXrandr, libXrender.
RDEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXrender
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
"
BDEPEND="virtual/pkgconfig"
