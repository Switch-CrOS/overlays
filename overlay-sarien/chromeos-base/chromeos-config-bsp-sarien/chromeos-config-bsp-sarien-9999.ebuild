# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="empty-project"

DESCRIPTION="Chrome OS Model configuration package for sarien."
HOMEPAGE="http://src.chromium.org"

LICENSE="BSD-Google"
KEYWORDS="-* ~amd64 ~x86"

inherit cros-unibuild cros-workon

src_install() {
	install_model_files
}
