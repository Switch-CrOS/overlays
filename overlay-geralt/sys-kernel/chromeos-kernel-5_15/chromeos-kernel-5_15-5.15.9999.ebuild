# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="93401ba1d63517c0b521c47f7966faf491758664"
CROS_WORKON_TREE="6943742d8df2cafe87692b3cc47e33b6281dc9dd"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
# TODO: Fix it when the official CrOS kernel branch is created.
CROS_WORKON_LOCALNAME="kernel/v5.15"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel2

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
# TODO: Fix it when the official CrOS kernel branch is created.
DESCRIPTION="Chrome OS Linux Kernel experimental 5.19-rc7 with Geralt private patches."
KEYWORDS="*"
