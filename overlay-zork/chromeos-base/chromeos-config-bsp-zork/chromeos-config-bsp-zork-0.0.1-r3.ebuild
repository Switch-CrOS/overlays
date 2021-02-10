# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="15a943d818a1aaa94bb999846c62444a37be6256"
CROS_WORKON_TREE=("02202d2c69c60f3f30833d593c33dff484176a9a" "8163658c3df24ddb5bb4f97729be56de3ec74a75" "bc0ad2b0d6dac0db793f13fb3d0177919cc9177b" "144da84d43f3a941ee62d52d7059daeef5dfb2e5" "e8656d52c29258e986e8dd687b49166e7b3a9e7c" "12b082c408b49a5f22bd26debefa185762fd5e1c" "21e7b9d59090702bbacfe80a8c9c0206f382ca7a" "9a50b370630902e409679083c73a4c5383b05b4e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
    "berknip"
    "dalboz"
    "dirinboz"
    "ezkinil"
    "morphius"
    "trembyle"
    "vilboz"
    "woomax"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "zork/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( zork )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for zork"
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
