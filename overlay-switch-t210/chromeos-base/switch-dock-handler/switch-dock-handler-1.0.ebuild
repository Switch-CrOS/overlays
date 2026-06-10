# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Nintendo Switch dock display handler (internal panel <-> dock HDMI via RandR)"
HOMEPAGE="https://wiki.switchroot.org/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64"
IUSE=""

# The handler drives the X output via xrandr; ash-set-display-size links libX11
# to resize the Ash host window (which makes Ash adapt its display resolution).
RDEPEND="
	x11-apps/xrandr
	x11-libs/libX11
"
DEPEND="x11-libs/libX11"

# Everything ships from ${FILESDIR}.
S="${WORKDIR}"

src_compile() {
	$(tc-getCC) ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} \
		-o ash-set-display-size \
		"${FILESDIR}/ash-set-display-size.c" -lX11 || die "compile failed"
}

src_install() {
	# Helper that resizes the Ash host window -> Ash reconfigures its display.
	dosbin ash-set-display-size

	# Upstart job: applies the DSI-0 <-> DP-0 routing on dock/undock + UI start.
	insinto /etc/init
	doins "${FILESDIR}/dock-handler.conf"

	# udev rule: emits the switch-dock-changed upstart event on dp state change.
	insinto /lib/udev/rules.d
	doins "${FILESDIR}/92-switch-dock.rules"
}
