# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("4389259ce45a2f1bfddb54b4fd9ea4fb551cbf11" "1e2e9d7183f545eefd1a86a07b0ab6f91d837a6c")
CROS_WORKON_TREE=("56b2c3f8dab18a1b7b782905d1ea918860027409" "fdbc51bbd5a7ee9d532ea1aa30cf21e57ca199db")
CROS_WORKON_PROJECT=(
	"chromiumos/platform/ec"
	"chromiumos/third_party/cryptoc"
)
CROS_WORKON_LOCALNAME=(
	"platform/ec"
	"third_party/cryptoc"
)
CROS_WORKON_DESTDIR=(
	"${S}/platform/ec"
	"${S}/third_party/cryptoc"
)

inherit cros-workon cros-ish

DESCRIPTION="ECOS ISH image"
HOMEPAGE="https://www.chromium.org/chromium-os/ec-development"

LICENSE="BSD-Google"
KEYWORDS="*"
