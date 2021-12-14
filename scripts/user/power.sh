END=$(brightnessctl m)

dim() {
  typeset -i i END
  brightnessctl s $END
  for ((i = 15; i <= 90; i += 5)); do
    brightnessctl s "$i%-"
    sleep $1
  done
}

if [ "$1" = "suspend" ]; then
  dim 0.15
  wait
  betterlockscreen -l
  wait
  systemctl suspend
  wait
  brightnessctl s 999999
elif [ "$1" = "reboot" ]; then
  dim 0.25
  wait
  systemctl reboot
elif [ "$1" = "off" ]; then
  dim 0.25
  wait
  systemctl poweroff
fi
