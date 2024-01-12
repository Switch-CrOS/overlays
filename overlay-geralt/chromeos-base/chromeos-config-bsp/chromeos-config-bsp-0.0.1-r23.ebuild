# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="96c143520f5c360c4e8ed4d7c9568c2879f852ee"
CROS_WORKON_TREE=("5030ccb1da0ef4eba245a4c0cad91045ad3d8cce" "92c68aa3d577c55ef4b214104523628d987a526a")
inherit cros-constants
CROS_WORKON_REPO="${CROS_GIT_HOST_URL}"

PROJECTS=(
	"ciri"
	"geralt"
)

CONFIG_PATH="sw_build_config/platform/chromeos-config"

CROS_WORKON_PROJECT=( "chromiumos/project" )
CROS_WORKON_LOCALNAME=( "project_public" )
CROS_WORKON_SUBTREE=( "$(printf "geralt/%s/${CONFIG_PATH} " "${PROJECTS[@]}")" )
CROS_WORKON_DESTDIR=( "${PROJECTS[@]/#/${S}/}" )
CROS_BOARDS=( geralt )

inherit cros-unibuild cros-workon

DESCRIPTION="Chrome OS Model configuration package for geralt"
HOMEPAGE="https://www.chromium.org/chromium-os"
SRC_URI=""

LICENSE="BSD-Google"
KEYWORDS="*"

RDEPEND="!chromeos-base/chromeos-config-bsp-geralt"

src_compile() {
	platform_json_compile
}


src_install() {
	platform_json_install
}
