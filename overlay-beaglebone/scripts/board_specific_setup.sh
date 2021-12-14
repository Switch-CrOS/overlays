#!/bin/bash

# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Installs the MLO and copies u-boot to the ESP.  This is used combined with
# a hybrid MBR to allow booting a Beaglebone from microSD only.
board_update_bootloaders() {
  local sysroot="$1"
  local efi_dir="$2"

  sudo cp "${sysroot}/firmware/u-boot.img" "${efi_dir}/" || exit
  sudo cp "${sysroot}/firmware/MLO" "${efi_dir}/" || exit
  sudo cp "${sysroot}/firmware/uEnv.txt" "${efi_dir}/" || exit
}
