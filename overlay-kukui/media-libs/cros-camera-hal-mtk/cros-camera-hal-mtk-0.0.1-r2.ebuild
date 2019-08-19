# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="e03024e521466da520b39943fb662db75d78b3bb"
CROS_WORKON_TREE="9d7ac462665b4515877ac7179a854256b4f8bcdd"
CROS_WORKON_PROJECT="chromiumos/platform2"
CROS_WORKON_LOCALNAME="../platform2"
CROS_WORKON_BLACKLIST="1"
CROS_WORKON_OUTOFTREE_BUILD="1"

PLATFORM_SUBDIR="camera"
PLATFORM_GYP_FILE="hal/mediatek/libcamera_hal.gyp"

inherit cros-camera cros-workon platform

DESCRIPTION="Mediatek ISP Chrome OS camera HAL"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="-* arm arm64"

RDEPEND="
	media-libs/cros-camera-libcab
	media-libs/cros-camera-libcamera_common
	media-libs/cros-camera-libcamera_metadata
	media-libs/cros-camera-libcamera_v4l2_device
	media-libs/cros-camera-libcbm
	media-libs/libsync
	media-libs/mtk-hal-config
	media-libs/mtk-isp-3a-libs-bin
	media-libs/mtk-sensor-metadata
	media-libs/mtk-tuning-libs-bin
"

DEPEND="${RDEPEND}
	chromeos-base/metrics
	media-libs/cros-camera-android-headers
	sys-kernel/linux-headers
	virtual/pkgconfig
"

src_prepare() {
	eapply -p2 "${FILESDIR}"/camera_hal_tot.patch
	find "${S}" -type f -name "*.sh" -exec chmod +x {} +
	cros-workon_src_prepare
	eapply_user
}

src_install() {
	# install hal libs to dev
	dolib.so "${OUT}/lib/"*.so
	dobin "${OUT}/setprop"
	dobin "${OUT}/getprop"
	dobin "${OUT}"/eeprom_updater
	cros-camera_dohal "${OUT}/lib/libcamera.mt8183.so" mtk_cam_hal.so
}
