# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64 arm"
IUSE="cheets"
S="${WORKDIR}"

RDEPEND="
	net-misc/rmtfs
"
DEPEND="${RDEPEND}"

src_install() {
	# Override default CPU clock speed governor.
	insinto "/etc"
	doins "${FILESDIR}/cpufreq.conf"

	# Install cpuset adjustments.
	insinto "/etc/init"
	doins "${FILESDIR}/platform-cpusets.conf"
	if use cheets; then
		insinto "/opt/google/containers/android/vendor/etc/init/"
		doins "${FILESDIR}/init.cpusets.rc"
	fi
}
