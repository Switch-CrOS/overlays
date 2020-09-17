# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="24134f20584ea339e56b96a1709a22121159b38e"
CROS_WORKON_TREE="44f40cd25e67b9265fbb96c0eb68c0e9c72c9cd5"
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_INT_HOST_URL}"

PROJECTS=(
	"milkyway"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "galaxy/milkyway/${CONFIG_PATH}" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( galaxy )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for galaxy"
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
