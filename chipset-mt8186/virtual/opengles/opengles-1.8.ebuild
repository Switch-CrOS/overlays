# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for OpenGLES implementations"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="-* arm arm64"
IUSE=""

DEPEND="
	media-libs/mali-drivers-bifrost-bin
	x11-drivers/opengles-headers
"
RDEPEND="${DEPEND}"
BDEPEND=""
