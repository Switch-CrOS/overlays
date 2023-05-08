# Copyright 2023 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CROS_WORKON_COMMIT="47687215fa2386e5c1f0a4f20502ead09e4a9053"
CROS_WORKON_TREE=("7cf43003f3ab539ba7b1211d45e9439e3413dd7c" "ddba3f2dd83bd97b27936191e2b01cc19f89c63a" "c75d73c762a0567bc6d0c99e63ec7ce925d6fc17")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"cora"
	"hades"
	"zeus"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "hades/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( hades )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for hades"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
SLOT="0/${PF}"
KEYWORDS="* amd64 x86"
RDEPEND="!chromeos-base/chromeos-config-bsp-hades"


src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
