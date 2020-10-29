# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="35076ee1563f59dafc8222a554151fd3e1235cb5"
CROS_WORKON_TREE=("9c9a8076f7eca332017b148352840f9415597d63" "08af709d08f02df3613a6db5ca38a333a07a244c" "76d10d566bb9c88d46c0db9849f7b98df89d70bc" "19bb33f7658ec114c83a0732bab3f42a271f3a1c" "c33299690d00e58d520d667023c29fd00ceb1b5a" "1d1389bafb65cd40543d43fff1e7481e3e50d9f4" "829843d2bf29c1193434c55efb58db462313d3e9" "9a50b370630902e409679083c73a4c5383b05b4e")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_INT_HOST_URL}"

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
