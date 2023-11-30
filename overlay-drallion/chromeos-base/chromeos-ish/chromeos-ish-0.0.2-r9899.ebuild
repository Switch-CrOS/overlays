# Copyright 2019 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE.makefile file.

EAPI=7

CROS_WORKON_COMMIT=("79f9898dadba1c439daefe98313df37582a2765d" "0dd679081b9c8bfa2583d74e3a17a413709ea362")
CROS_WORKON_TREE=("f09a66e04d20faec02639464146291ef8d69f63a" "d99abee3f825248f344c0638d5f9fcdce114b744")
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
