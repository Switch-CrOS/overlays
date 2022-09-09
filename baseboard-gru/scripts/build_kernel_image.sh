#!/bin/bash

# Copyright 2022 The ChromiumOS Authors
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  # TODO(b/231167263): drop conditionals once kernel 4.4 is gone. Kernel 4.4
  # doesn't have TEO governor.

  # FLAGS_* are set by parent script.
  # shellcheck disable=SC2154
  if ! has "kernel-4_4" "$("portageq-${FLAGS_board}" envvar USE)"; then
    echo "cpuidle.governor=teo" >> "$1"
  fi
}
