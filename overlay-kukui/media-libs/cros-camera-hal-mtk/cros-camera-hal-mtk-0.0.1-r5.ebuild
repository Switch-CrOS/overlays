# Copyright 2019 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CROS_WORKON_COMMIT="2107ed72bc0367fb9cad669d03cfd042ddaac08e"
CROS_WORKON_TREE="f2fce0c5feb88585f26fd24642163b4019345cc8"
CROS_WORKON_PROJECT="chromiumos/platform2"
CROS_WORKON_LOCALNAME="../platform2"
CROS_WORKON_BLACKLIST="1"
CROS_WORKON_OUTOFTREE_BUILD="1"

PLATFORM_SUBDIR="camera/hal/mediatek"

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

src_unpack() {
	platform_src_unpack
	cd cros-camera-hal-mtk-0.0.1
	eapply -p1 "${FILESDIR}"/camera_hal_tot.patch
	find "${S}" -type f -name "*.sh" -exec chmod +x {} +
	find "${S}" -type f -name "*.py" -exec chmod +x {} +
}

src_prepare() {
	cros-workon_src_prepare
	eapply_user
	# TODO (crbug.com/995954): Remove after replacing deprecated functions.
	append-flags "-Wno-error"
}

src_install() {
	# install hal libs to dev
	dolib.so "${OUT}/lib/"*.so
	dobin "${OUT}/setprop"
	dobin "${OUT}/getprop"
	dobin "${OUT}"/eeprom_updater
	cros-camera_dohal "${OUT}/lib/libcamera.mt8183.so" mtk_cam_hal.so
}
