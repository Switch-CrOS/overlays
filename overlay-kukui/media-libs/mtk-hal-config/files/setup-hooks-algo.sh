#!/bin/bash

#update eeprom to /run/camera/EEPROM/
eeprom_updater
chmod 644 /run/camera/EEPROM/main_sensor_eeprom
chmod 644 /run/camera/EEPROM/sub_sensor_eeprom

