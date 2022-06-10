#!/bin/bash

if [ "$1" = "suspend" ]; then
  systemctl suspend
elif [ "$1" = "reboot" ]; then
  systemctl reboot
elif [ "$1" = "off" ]; then
  systemctl poweroff
fi
