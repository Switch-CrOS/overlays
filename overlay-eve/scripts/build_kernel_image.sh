#!/bin/bash

# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

modify_kernel_command_line() {
  # Don't disable the ability to run VMs.
  echo "disablevmx=off" >> "$1"

  # Enable GuC/HuC
  echo "i915.enable_guc_loading=1" >> "$1"
  echo "i915.enable_guc_submission=0" >> "$1"
}
