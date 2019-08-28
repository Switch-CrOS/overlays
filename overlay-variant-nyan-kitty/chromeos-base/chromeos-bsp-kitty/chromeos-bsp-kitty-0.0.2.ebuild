# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Kitty bsp (meta package to pull in driver/tool deps)"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm"

DEPEND="!<chromeos-base/chromeos-bsp-kitty-private-0.0.2"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	doappid "{2A52A861-EDBF-5268-5DD4-9C85E5BE2419}" "CHROMEBASE" # nyan-kitty

	# Install Bluetooth ID override.
	insinto "/etc/bluetooth"
	doins "${FILESDIR}/main.conf"

	# Install audio configs
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs nyan_kitty "${audio_config_dir}"
}
