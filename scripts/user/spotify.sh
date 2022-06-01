if [[ $(xdotool search --onlyvisible --class spotify) ]]; then
  i3-msg "workspace back_and_forth"
else
  if [[ $(xdotool search --class "spotify") ]]; then
    i3-msg "workspace Spotify"
  else
    i3-msg "workspace Spotify; exec spotify"
  fi
fi
