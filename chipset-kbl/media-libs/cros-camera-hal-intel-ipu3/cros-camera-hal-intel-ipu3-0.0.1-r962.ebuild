# Copyright 2017 The ChromiumOS Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

CROS_WORKON_COMMIT=("f156e48100dc991f9e3c4bf3c3fd501fa0570075" "5082c373616f611e138b842b7a9586e3b419c329")
CROS_WORKON_TREE=("f91b6afd5f2ae04ee9a2c19109a3a4a36f7659e6" "b652b7384f8dbfea15275e7704542feaa32864bc" "d5445309857e3ef75fd2cb71a3203029a0899112")
CROS_WORKON_PROJECT=("chromiumos/platform2" "chromiumos/platform/camera")
CROS_WORKON_LOCALNAME=("../platform2" "../platform/camera")
CROS_WORKON_DESTDIR=("${S}/platform2" "${S}/platform2/platform_camera")
CROS_WORKON_SUBTREE=(".gn common-mk" "hal/intel/ipu3")
CROS_WORKON_INCREMENTAL_BUILD="1"

PLATFORM_SUBDIR="platform_camera/hal/intel/ipu3"

inherit cros-camera cros-workon platform

DESCRIPTION="Intel IPU3 (Image Processing Unit) Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* amd64"

RDEPEND="
	chromeos-base/cros-camera-android-deps
	chromeos-base/cros-camera-libs
	dev-libs/expat
	media-libs/intel-3a-libs-bin
	media-libs/intel-pvl-libs-bin
	media-libs/libsync"

DEPEND="${RDEPEND}
	media-libs/libyuv
	sys-kernel/linux-headers
	virtual/jpeg:0
	virtual/pkgconfig"
