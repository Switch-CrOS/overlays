# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2
EAPI=4

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE="bob-arc64"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-gru
"
DEPEND="${RDEPEND}"

src_install() {
	if use bob-arc64; then
		doappid "{1EBA9C6B-32D9-4072-91B7-ED12651315CA}" "CHROMEBOOK"
	else
		doappid "{564AC308-CBD5-485D-9EF5-EB97DBB5F264}" "CHROMEBOOK"
	fi

	# Install audio config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs bob "${audio_config_dir}"

	# Install platform specific config files for power_manager.
	insinto "/usr/share/power_manager/board_specific"
	doins "${FILESDIR}"/powerd_prefs/*
}
