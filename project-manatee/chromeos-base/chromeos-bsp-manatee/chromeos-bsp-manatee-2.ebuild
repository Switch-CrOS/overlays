# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Ebuild which pulls in any necessary ebuilds as dependencies
or portage actions."

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="-* amd64 x86 arm64"

IUSE="manatee +manatee-5_4 manatee-5_10 iwlwifi-gfp2-firmware iwlwifi-hrp2-firmware"

# exactly one of foo, bar, or baz must be set, but not several
REQUIRED_USE="^^ ( manatee-5_4 manatee-5_10 )"

RDEPEND="
	manatee? (
		manatee-5_4? ( sys-kernel/chromeos-kernel-5_4-manatee )
		manatee-5_10? ( sys-kernel/chromeos-kernel-5_10-manatee )
		iwlwifi-gfp2-firmware? (
			=sys-kernel/iwlwifi-gfp2-firmware-69.45:=
		)
		iwlwifi-hrp2-firmware? (
			=sys-kernel/iwlwifi-hrp2-firmware-69.45:=
		)
	)
"
