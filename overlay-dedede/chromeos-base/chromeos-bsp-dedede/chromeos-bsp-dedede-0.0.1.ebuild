# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

inherit appid cros-audio-configs

DESCRIPTION="dedede board-specific ebuild that pulls in necessary ebuilds as
dependencies or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
S="${WORKDIR}"

RDEPEND="
	chromeos-base/sof-binary
	chromeos-base/sof-topology
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{E0DD1258-E890-493E-ADA3-0C755240B89C}" "CHROMEBOOK"

	# Install audio config files
	local audio_config_dir="${FILESDIR}/audio-config"
	install_audio_configs dedede "${audio_config_dir}"
}
