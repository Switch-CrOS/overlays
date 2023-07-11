# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# As the revert to sof-topology-2.2-r4 due to b/290554805
#  - This ebuild file is renamed to the increasing version
#  - ${PV} is replaced with 2.2 literally

EAPI=7

DESCRIPTION="SOF topology files for Nissa"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-nissa-2.2.tar.bz2"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

S=${WORKDIR}/${PN}-nissa-2.2

src_install() {
	insinto /lib/firmware/intel/sof-tplg
	doins ./*.tplg
	dosym ./sof-adl-max98360a-rt5682.tplg /lib/firmware/intel/sof-tplg/sof-adl-max98360a-cs42l42.tplg
}
