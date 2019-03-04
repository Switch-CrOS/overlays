#!/bin/sh

# Create path for scheduling preference
if [ ! -d /sys/fs/cgroup/schedtune/camera ]; then
  mkdir -p /sys/fs/cgroup/schedtune/camera
fi

sleep 0.1
for pid in $(pgrep -f "cros_camera_service")
do
  echo "$pid" > /sys/fs/cgroup/schedtune/camera/cgroup.procs
done
echo 1 >   /sys/fs/cgroup/schedtune/camera/schedtune.prefer_idle

