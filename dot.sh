# critial startup scripts, use startup.sh for device-specific actions.

# copy env.sh if it does not already exist
cp -n ~/dot/env.example.sh ~/dot/env.sh


source ~/dot/env.sh

# start pulseaudio
start-pulseaudio-x11

# run xrandr
xrandr --output "$DISPLAY" --mode "$RESOLUTION" --rate "$FPS"

# set wallpaper
feh --bg-fill ~/dot/wallpaper.png

# full brightness on startup
brightnessctl s 999999

# run custom startup script
bash ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh
