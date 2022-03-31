# Copyright 2022 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

DESCRIPTION="Virtual package for Vulkan Installable Client Driver"
LICENSE="metapackage"

SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	media-libs/vulkan-loader
	media-libs/mesa-iris[vulkan]
"
