# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Nintendo Switch dock display handler (internal panel <-> dock HDMI via RandR)"
HOMEPAGE="https://wiki.switchroot.org/"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64"
IUSE=""

# The handler drives the X display via xrandr.
RDEPEND="x11-apps/xrandr"

# Everything ships from ${FILESDIR}.
S="${WORKDIR}"

src_install() {
	# Upstart job: applies the DSI-0 <-> DP-0 routing on dock/undock + UI start.
	insinto /etc/init
	doins "${FILESDIR}/dock-handler.conf"

	# udev rule: emits the switch-dock-changed upstart event on dp state change.
	insinto /lib/udev/rules.d
	doins "${FILESDIR}/92-switch-dock.rules"
}
