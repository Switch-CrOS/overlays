# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

XORG_MODULE="xserver/"
XORG_TARBALL_SUFFIX="xz"
XORG_EAUTORECONF="no"

inherit xorg-3

DESCRIPTION="X.Org X server"
KEYWORDS="-* arm64"
IUSE="+xorg debug doc ipv6 xcsecurity"
RESTRICT="mirror"

RDEPEND="
	!x11-base/switch-l4t-xorg
	dev-libs/libbsd
	dev-libs/libgcrypt
	sys-apps/dbus
	sys-libs/zlib
	virtual/udev
	x11-apps/xkbcomp
	x11-base/xorg-proto
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXfont2
	x11-libs/libdrm
	x11-libs/libpciaccess
	x11-libs/libxshmfence
	x11-libs/pixman
	x11-misc/xkeyboard-config
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	x11-misc/util-macros
	media-fonts/font-util
"

XORG_CONFIGURE_OPTIONS=(
	--enable-xorg
	--disable-debug
	--enable-ipv6
	--disable-xcsecurity
	--disable-devel-docs
	--disable-docs
	--disable-dmx
	--disable-dri
	--disable-dri2
	--disable-dri3
	--disable-glamor
	--disable-kdrive
	--disable-libunwind
	--disable-selective-werror
	--disable-static
	--disable-systemd-logind
	--disable-unit-tests
	--disable-xephyr
	--disable-xnest
	--disable-xselinux
	--disable-xvfb
	--enable-config-udev
	--disable-config-udev-kms
	--disable-suid-wrapper
	--with-module-dir=/usr/lib/xorg/modules
	--with-xkb-path=/usr/share/X11/xkb
	--with-xkb-bin-directory=/usr/bin
	--with-xkb-output=/var/lib/xkb
	--with-default-xkb-rules=evdev
	--with-default-xkb-model=pc105
	--with-default-xkb-layout=us
	--with-fallback-input-driver=libinput
	--with-default-font-path=/usr/share/fonts/misc,/usr/share/fonts/100dpi,/usr/share/fonts/75dpi,built-ins
)

src_install() {
	xorg-3_src_install
	rm -rf "${D}"/var || die

	dodir /usr/lib/xorg
	dosym ../../bin/Xorg /usr/lib/xorg/Xorg
}
