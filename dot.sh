# critial startup scripts, use startup.sh for device-specific actions.
source ~/dot/env.sh

# start pulseaudio
start-pulseaudio-x11

# run xrandr
xrandr --output "$DISPLAY" --mode "$RESOLUTION" --rate "$FPS"

# set wallpaper
feh --bg-fill ~/dot/wallpaper.png

# full brightness on startup
brightnessctl s 999999

# copy env.sh
cp -n ~/dot/env.example.sh ~/dot/env.sh

# run custom startup script
bash ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh
