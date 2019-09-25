# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for OpenGLES implementations"

SLOT="0"
KEYWORDS="-* arm64 arm"

DEPEND="media-libs/mesa-freedreno"

RDEPEND="${DEPEND}"
