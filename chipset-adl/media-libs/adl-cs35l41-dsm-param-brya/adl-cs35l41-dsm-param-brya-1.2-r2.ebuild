# Copyright 2021 The ChromiumOS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ADLCS35l41 DSM firmware and tuning files"
SRC_URI="
gs://chromeos-localmirror/distfiles/dsm-param-vell-${PV}.tar.bz2
"

LICENSE="LICENSE.dsm"
SLOT="0"
KEYWORDS="-* x86 amd64"

S="${WORKDIR}"

src_install() {
	insinto /lib/firmware/cirrus

	# The TL, TR speakers share a same calibration value
	newins cs35l41-dsp1-spk-cali-tl.bin cs35l41-dsp1-spk-cali-103ca221-tl.bin
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103ca221-tr.bin

	# The WL, WR speakers share a same calibration value
	newins cs35l41-dsp1-spk-cali-wl.bin cs35l41-dsp1-spk-cali-103ca221-wl.bin
	dosym ./cs35l41-dsp1-spk-cali-103ca221-wl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103ca221-wr.bin

	# TL TR share protect firmware
	newins cs35l41-dsp1-spk-prot-tl.bin cs35l41-dsp1-spk-prot-103ca221-tl.bin
	dosym ./cs35l41-dsp1-spk-prot-103ca221-tl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103ca221-tr.bin

	# WL WR share protect firmware
	newins cs35l41-dsp1-spk-prot-wl.bin cs35l41-dsp1-spk-prot-103ca221-wl.bin
	dosym ./cs35l41-dsp1-spk-prot-103ca221-wl.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103ca221-wr.bin

	newins cs35l41-dsp1-spk-cali-tl.wmfw cs35l41-dsp1-spk-cali-103ca221-tl.wmfw
	# All speakers share the same extended firmware file (.wmfw)
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103ca221-tr.wmfw
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103ca221-wl.wmfw
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103ca221-wr.wmfw
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103ca221-tl.wmfw
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103ca221-tr.wmfw
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103ca221-wl.wmfw
	dosym ./cs35l41-dsp1-spk-cali-103ca221-tl.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103ca221-wr.wmfw
}
