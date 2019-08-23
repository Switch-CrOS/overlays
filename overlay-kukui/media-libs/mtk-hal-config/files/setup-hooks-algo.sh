#!/bin/bash

# get config path for camera
config_path=$(cros_config /camera config-path)
ln -s "$config_path" /run/camera/camera_config_path

# update eeprom to /run/camera/EEPROM/

eeprom_updater
chmod 644 /run/camera/EEPROM/main_sensor_eeprom
chmod 644 /run/camera/EEPROM/sub_sensor_eeprom

