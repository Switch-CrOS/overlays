# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Blaze bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"

DEPEND="!<chromeos-base/chromeos-bsp-blaze-private-0.0.2"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	doappid "{D35424B0-18B3-8134-D22F-840F039499BE}" "CHROMEBOOK" # nyan-blaze

	# Install Bluetooth ID override.
	insinto "/etc/bluetooth"
	doins "${FILESDIR}/main.conf"

	# Install platform-specific config files for power manager
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*

	# Install audio configs
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs nyan_blaze "${audio_config_dir}"
}
