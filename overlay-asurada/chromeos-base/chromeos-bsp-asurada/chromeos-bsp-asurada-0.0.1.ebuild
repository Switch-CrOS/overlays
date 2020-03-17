# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=5

inherit appid cros-audio-configs

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
RDEPEND="
  chromeos-base/chromeos-config
  chromeos-base/chromeos-bsp-baseboard-asurada
"
DEPEND="${RDEPEND}"

src_install() {
	doappid "{08F65CC8-BCFB-414F-9B49-DAB2996D2E71}" "CHROMEBOOK"

	local ucm_config="${FILESDIR}/ucm-config"
	if [[ -d "${ucm_config}" ]] ; then
		# install ucm config files
		insinto /usr/share/alsa/ucm
		doins -r "${ucm_config}"/*
	fi

	local cras_config="${FILESDIR}/cras-config"
	if [[ -d "${cras_config}" ]] ; then
		# install cras config files
		insinto /etc/cras
			doins -r "${cras_config}"/*
	fi
}
