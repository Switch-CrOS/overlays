# Copyright 2023 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

EAPI=7

CROS_WORKON_COMMIT="a6f350cdcba57361e3e9f1fe4fbe944d0f289997"
CROS_WORKON_TREE="77e3eae17753e281fc295d43abee6b8661391b88"
CROS_WORKON_PROJECT="chromiumos/third_party/kernel"
CROS_WORKON_LOCALNAME="kernel/v6.1"
CROS_WORKON_MANUAL_UPREV="1"

inherit cros-workon cros-kernel

HOMEPAGE="https://www.chromium.org/chromium-os/chromiumos-design-docs/chromium-os-kernel"
DESCRIPTION="Chrome OS Linux Kernel 6.1 with Geralt private patches."
KEYWORDS="*"

# This is for MT8188G only.
# It had been developing with chromeos-kernel-upstream before the 6.1 kernel
# was ready in the early stage.
# This ensures that the old kernel target will be rejected and cleared when
# building the new 6.1 kernel.
# CQ should be fine without this, but just in case so that Portage cleans up
# the dependency properly in developers' local incremental builds.
RDEPEND="
	!sys-kernel/chromeos-kernel-upstream
"
