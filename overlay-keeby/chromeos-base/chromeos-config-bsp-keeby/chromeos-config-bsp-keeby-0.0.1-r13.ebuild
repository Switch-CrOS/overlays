# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="92af84e7232a899a109c2e27856bb403fb25a638"
CROS_WORKON_TREE=("24b737cd5eb29d6d09a4d0fde3090890aebae1df" "f39402b78e392b8f1c2bc27a08c27352696b826b" "87ea0199cc450a8d10a7a632a0958067677124c9" "7b4203f828fa0c0522c6e997e97f9d04ba12a26c" "3d66263f83485742f40e1edbc65e502d47a8c806" "57c4c500a5249090b216edae6e7e1031a9c4d17f" "d97467e7f00ba21dc091ca302444d14955c44ccc")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"waddledoo2"
	"lalala"
	"cappy2"
	"driblee"
	"corori"
	"gooey"
	"haboki"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "keeby/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( keeby )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for keeby"
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
