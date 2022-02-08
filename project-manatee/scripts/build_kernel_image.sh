#!/bin/bash

# Copyright 2022 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# All kernel command line changes must update the security base lines in
# the signer.  It rejects any settings it does not recognize and breaks the
# build.  So any modify_kernel_command_line() function change here needs to be
# reflected in ensure_secure_kernelparams.config.

# See crrev.com/i/216896 as an example.

modify_kernel_command_line() {
  # Remove the current directory from the list of overlay directories, and then
  # reload and execute the modify_kernel_command_line function that we
  # overwrote. Do this in a subshell so the modifications to global variable
  # don't leak to our caller.
  (
    BOARD_OVERLAY=$(sed 's/\S*project-manatee//' <<< "${BOARD_OVERLAY}")
    load_board_specific_script "build_kernel_image.sh"
    modify_kernel_command_line "$1"
  )

  # The hardware the hypervisor accesses is very limited, and
  # none of it requires the swiotlb.
  echo "swiotlb=noforce" >> "$1"
}
