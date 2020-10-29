# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="35076ee1563f59dafc8222a554151fd3e1235cb5"
CROS_WORKON_TREE=("618a1c0f7c6c4922338d7414c00005eb09fc27df" "995de8cc0ab1739f822dde1211956a1dab2fd69e" "1cea9b062ea7c1f07ae43e3cf48433f2a0ac9e77" "138ea45c8615d90e555d7581542155acc543174d" "8beaaf18ff330a964c199d1039ff2aa3b59b3efa" "770ba97a2a045b29e2743bd86a055fbe0324ada6" "e83fe0ba6cef691937e9da73093f189e918b3dd2")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_INT_HOST_URL}"

PROJECTS=(
	"dooly"
    "duffy"
    "faffy"
    "kaisa"
    "noibat"
    "puff"
    "wyvern"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "puff/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( puff )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for puff"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
