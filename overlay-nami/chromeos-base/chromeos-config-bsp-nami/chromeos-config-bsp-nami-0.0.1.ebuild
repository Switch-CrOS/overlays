# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Chrome OS Model configuration package for coral"
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="-* amd64 x86"
IUSE="kernel-5_4"

inherit cros-unibuild

S=${WORKDIR}

# From an ideological purity perspective, this DEPEND should be there, but
# it can't be, since otherwise we end up with circular dependencies.
# DEPEND="virtual/chromeos-bsp"

src_install(){
	insinto "${UNIBOARD_YAML_DIR}"
	doins "${FILESDIR}/model.yaml"

	insinto "${UNIBOARD_YAML_DIR}/include"
	if use kernel-5_4; then
		newins "${FILESDIR}/include/kernelnext.yaml" "kernel-info.yaml"
	else
		newins "${FILESDIR}/include/kernel-info.yaml" "kernel-info.yaml"
	fi
}
