if [[ $(xdotool search --class "spotify") ]]; then
    i3-msg "workspace Spotify"
else
    i3-msg "workspace Spotify; exec spotify"
fi
