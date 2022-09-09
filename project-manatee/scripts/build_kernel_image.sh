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

  # By default, the dentry cache and inode cache allocate hash tables of
  # size num_pages/2 and num_pages/4, respectively, each with 8 byte entries.
  # Specify a smaller limit on manaTEE, since not much will run in the
  # hypervisor. The values are 1/8 the default size for a 8GB system.
  echo "dhash_entries=131072" >> "$1"
  echo "ihash_entries=65536" >> "$1"

  # KVM spends considerable amount of time of halt polling upon HLT VM exits,
  # which not only significantly increases host CPU utilization, but also hurts
  # power saving.
  echo "kvm.halt_poll_ns=0" >> "$1"

  # hypervisor allows Crosvm to write to MSRs through /dev/cpu/CPUNUM/msr
  echo "msr.allow_writes=on" >> "$1"
}
