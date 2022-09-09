# Copyright 2016 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit appid cros-audio-configs udev

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE="kevin-arcnext kevin-kernelnext kernel-4_4"
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
	>=chromeos-base/chromeos-bsp-baseboard-gru-0.0.3
	chromeos-base/chromeos-touch-config-kevin
"
DEPEND="${RDEPEND}"

src_install() {
	if use kevin-arcnext; then
		doappid "{35EF2A87-CD2B-62EE-E83C-F6E0F71C7FEE}" "CHROMEBOOK"
	elif use kevin-kernelnext; then
		doappid "{0D52E43D-2385-4F7C-8EAF-F995EE47C5CB}" "CHROMEBOOK"
	else
		doappid "{92A7272A-834A-47A3-9112-E8FD55831660}" "CHROMEBOOK" # kevin
	fi

	# Install audio config files
	if use kernel-4_4; then
		local audio_config_dir="${FILESDIR}/audio-config-4.4"
	else
		local audio_config_dir="${FILESDIR}/audio-config"
	fi
	install_audio_configs kevin "${audio_config_dir}"

	# Disable touchpad wakeup source completely
	udev_dorules "${FILESDIR}/93-powerd-overrides.rules"
}
