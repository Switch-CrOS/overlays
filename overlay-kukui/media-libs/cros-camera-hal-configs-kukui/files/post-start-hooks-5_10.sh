#!/bin/sh
# Copyright 2021 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Create path for scheduling preference
if [ ! -d /sys/fs/cgroup/cpu/camera/service ]; then
  mkdir -p /sys/fs/cgroup/cpu/camera/service
fi

for pid in $(pgrep -f "cros_camera_service")
do
  echo "${pid}" > /sys/fs/cgroup/cpu/camera/service/cgroup.procs
done

echo "1" > /sys/fs/cgroup/cpu/camera/service/cpu.uclamp.latency_sensitive
echo "20.00" > /sys/fs/cgroup/cpu/camera/service/cpu.uclamp.min
