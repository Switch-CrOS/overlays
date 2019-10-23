# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="* amd64 x86"
IUSE=""
S="${WORKDIR}"

# Add dependencies on other ebuilds from within this board overlay
DEPEND=""
RDEPEND="
	${DEPEND}
	!<chromeos-base/chromeos-bsp-sarien-0.0.2
"

src_install() {
	# All wilco devices contain an RTC in the EC that needs to
	# be kept in sync with local time so that charge scheduling happens
	# at the correct time. This upstart script will do that.
	insinto /etc/init
	doins "${FILESDIR}/wilco_sync_ec_rtc.conf"
}
