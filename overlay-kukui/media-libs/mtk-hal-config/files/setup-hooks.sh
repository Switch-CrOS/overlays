#!/bin/bash

# get config path for camera
config_path=$(cros_config /camera config-path)
ln -s "$config_path" /run/camera/camera_config_path
