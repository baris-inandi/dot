launch() {
  if [[ "$2" = "-new-tab" ]]; then
    if [[ $(xdotool search --onlyvisible --class google-chrome-unstable) ]]; then
      google-chrome-unstable $1 $2
    else
      google-chrome-unstable $1 -new-window
    fi
  else
    google-chrome-unstable $1 $2--visible
  fi
}

i3-msg "mode default" &
launch $2 $3 &
notify-send "$1" "Launching web shortcut in browser..." -t 1000
