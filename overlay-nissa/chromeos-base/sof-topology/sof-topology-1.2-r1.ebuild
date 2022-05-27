# Copyright 2022 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=6

DESCRIPTION="SOF topology files for Nissa"
SRC_URI="gs://chromeos-localmirror/distfiles/${PN}-nissa-${PV}.tar.bz2"

LICENSE="SOF"
SLOT="0"
KEYWORDS="*"

S=${WORKDIR}/${PN}-nissa-${PV}

src_install() {
	insinto /lib/firmware/intel/sof-tplg
	newins ./sof-adl-max98360a-nau8825.tplg sof-adl-mx98360a-nau8825.tplg
	doins sof-adl-rt1019-rt5682.tplg
	insinto /lib/firmware/intel/sof-tplg/nivviks0
	doins sof-adl-mx98360a-nau8825.tplg
}
