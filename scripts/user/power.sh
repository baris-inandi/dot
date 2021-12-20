#!/bin/bash

hw_dim() {
  # for ((i = 75; i <= 90; i += 5)); do
  #   brightnessctl s "$i%-"
  #   sleep 0.2
  # done

  # brightnessctl already has a dim animation so no need for the custom animation above.
  brightnessctl s 15
}

soft_dim() {
  for ((i = 80; i >= 10; i -= 5)); do
    set_soft_brightness ".$((100 * $i / 100)) | sed -e 's/..$/.&/;t' -e 's/.$/.0&/'"
    sleep 0.02
  done
}

set_soft_brightness() {
  xrandr --output "DP-4" --brightness "$1"
}

restore_brightness() {
  brightnessctl s 999999
  set_soft_brightness 1
}

dim() {
  max=$(brightnessctl m)
  typeset -i i END
  if (($max <= 1)); then
    soft_dim
    wait
  else
    hw_dim
    wait
  fi
  sleep 0.1
}

handle_suspend() {
  betterlockscreen -l
  wait
  systemctl suspend
  wait
  sleep 0.1
  restore_brightness
}

if [ "$1" = "suspend" ]; then
  dim
  wait
  handle_suspend
elif [ "$1" = "reboot" ]; then
  dim
  wait
  systemctl reboot
elif [ "$1" = "off" ]; then
  dim
  wait
  systemctl poweroff
elif [ "$1" = "dimtest" ]; then
  dim
  wait
  sleep 0.5
  restore_brightness
fi
