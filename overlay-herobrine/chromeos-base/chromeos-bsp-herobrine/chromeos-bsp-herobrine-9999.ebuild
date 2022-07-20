# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7



# This ebuild only cares about its own FILESDIR and ebuild file, so it tracks
# the canonical empty project.
CROS_WORKON_PROJECT="chromiumos/infra/build/empty-project"
CROS_WORKON_LOCALNAME="platform/empty-project"

inherit appid cros-unibuild cros-workon

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* ~arm64 ~arm"
IUSE="herobrine-kernelnext"

RDEPEND="
	chromeos-base/chromeos-bsp-baseboard-herobrine
"
DEPEND="
	${RDEPEND}
	chromeos-base/chromeos-config:=
"

src_install() {
	if use herobrine-kernelnext; then
		doappid "{67EAF43A-C8C0-4190-9066-C7A628C9FF19}" "CHROMEBOOK"
	else
		doappid "{C5ED9176-A346-217C-DE59-1896036F7C8A}" "CHROMEBOOK"
	fi

	# Install audio config files
	unibuild_install_files audio-files
}
