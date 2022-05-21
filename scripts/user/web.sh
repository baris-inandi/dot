i3-msg "mode default" &
google-chrome-unstable -new-tab "$2" &
notify-send "$1" "Launching web shortcut in browser..." -t 1000
