# Copyright 2026 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="ALSA UCM2 configs for the Nintendo Switch (Tegra X1 RT5658 audio)"
HOMEPAGE="https://github.com/theofficialgman/l4t-debs-source"
LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* arm64"
IUSE=""
RESTRICT="mirror strip binchecks"

# theofficialgman's prebuilt switch-alsa-ucm2 deb (UCM2 routing for the
# tegra-snd-t210ref-mobile-rt565x card: AHUB/ADMAIF -> I2S -> RT5658 ->
# speaker/headphone/mics).  CRAS consumes standard ALSA UCM2, so these are
# reusable on ChromeOS.
L4T_DEBS="https://raw.githubusercontent.com/theofficialgman/l4t-debs/abf941d076a0849bf1f39cc457d1825c6b4a477b/pool/noble/s"
SRC_URI="${L4T_DEBS}/switch-alsa-ucm2/switch-alsa-ucm2_1.0-1+24.04_all.deb -> switch-alsa-ucm2_1.0-1_24.04_all.deb"

S="${WORKDIR}"

# Coexists with the base UCM tree; this only adds the Switch card's own
# subdirectory, so no file collisions with media-libs/alsa-ucm-conf.
RDEPEND="media-libs/alsa-ucm-conf"

src_unpack() {
	mkdir -p "${S}/deb" || die
	cd "${S}/deb" || die
	unpack_deb "${DISTDIR}/switch-alsa-ucm2_1.0-1_24.04_all.deb" || die
}

src_install() {
	# The deb lays its files out under usr/share (alsa/ucm2/...).  Mirror
	# that tree into the image verbatim.
	if [[ -d "${S}/deb/usr/share" ]]; then
		insinto /usr/share
		doins -r "${S}/deb/usr/share/."
	else
		die "unexpected deb layout: no usr/share"
	fi

	# CRAS card config (volume curve) for the RT5658 card.  CRAS looks it
	# up at /etc/cras/${card_name}/${card_name}; without it the speaker
	# node stays at volume 0 and the UI produces no sound despite correct
	# UCM routing.
	local card="tegra-snd-t210ref-mobile-rt565x"
	insinto "/etc/cras/${card}"
	newins "${FILESDIR}/${card}" "${card}"
}
