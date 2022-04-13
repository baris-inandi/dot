# critial startup scripts, use startup.sh for device-specific actions.

# copy env.sh if it does not already exist
cp -n ~/dot/env.example.sh ~/dot/env.sh

source ~/dot/env.sh

# run xrandr
xrandr --output "$DOT_DISPLAY" --mode "$DOT_RESOLUTION" --rate "$DOT_FPS"

# full brightness on startup
brightnessctl s 999999

# run custom startup script
bash ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh
