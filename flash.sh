#!/bin/bash

device=$(lsblk -r -o LABEL,NAME,MOUNTPOINT | grep "NICENANO" | awk '{ print $2 }')

if [ ! -z $device ]; then
  unzip ~/Downloads/firmware.zip && rm ~/Downloads/firmware.zip

  sudo mount /dev/"$device" ~/mnt
  sudo cp corne_left-nice_nano_v2-zmk.uf2 ~/mnt/
  echo reset right...
  read
  device=$(lsblk -r -o LABEL,NAME,MOUNTPOINT | grep "NICENANO" | awk '{ print $2 }')
  sudo mount /dev/"$device" ~/mnt
  sudo cp corne_right-nice_nano_v2-zmk.uf2 ~/mnt/
fi
