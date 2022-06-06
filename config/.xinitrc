#!/bin/sh

xrdb -merge ~/.Xresources

# copy env.sh if it does not already exist
cp -n ~/dot/env.example.sh ~/dot/env.sh

source ~/dot/env.sh

# run xrandr
xrandr --output "$DOT_DISPLAY" --mode "$DOT_RESOLUTION" --rate "$DOT_FPS"

# full brightness on startup
brightnessctl s 999999

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

bash ~/dot/scripts/setup/symlink.sh

exec i3

# start utility applications
dunst

# create files/dirs
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Downloads
mkdir -p ~/Desktop
touch ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh

# run custom startup script
bash ~/dot/startup.sh
