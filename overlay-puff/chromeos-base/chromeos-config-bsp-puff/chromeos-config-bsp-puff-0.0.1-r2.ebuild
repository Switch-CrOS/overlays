# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="35eacc1fe547f693493d2951a06541b01d8ccd20"
CROS_WORKON_TREE=("be40517a1ccb969dde9f46b9feb9cd6732e5c63e" "a525c0da82ee870f6e6447f85e76b2c9f01290e0" "b714cbad29618e11eb22af7aa282e212f56e7e03" "5cb0afe6b82a04405923abc2cb0fcf54962d2cd9" "5944e30613f40f7ae65b12a7ffd80fbc5a31974b" "7bce53dbaa866a9a615066ef829b02956e28c482" "0b1c3b40c86c0a15b21ad4a8459f94a256f93e8f")
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
