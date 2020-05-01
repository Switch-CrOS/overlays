#!/bin/bash

# Copyright 2020 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

modify_kernel_command_line() {

  # Enable GuC loading
  echo "i915.enable_guc=2" >> "$1"

  # TODO(b/154773379): Workaround for frequency scaling issues
  echo "intel_idle.max_cstate=1" >> "$1"

  # Enable S0ix logging using GSMI
  echo "gsmi.s0ix_logging_enable=1" >> "$1"
}
