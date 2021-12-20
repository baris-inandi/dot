# critial startup scripts, use startup.sh for device-specific actions.

# start pulseaudio
start-pulseaudio-x11

# set wallpaper
feh --bg-fill ~/dot/wallpaper.png

# full brightness on startup
brightnessctl s 999999

# run custom startup script
bash ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh
