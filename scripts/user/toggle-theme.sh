t=$(cat ~/.config/dot-theme)

render=$(python3 ~/dot/scripts/user/render.py)

if [ "$t" == "dark" ]; then
  t="light"
else
  t="dark"
fi

# save preference
echo $t >~/.config/dot-theme

eval "$render --brightness 0"

# symlink dotfiles
source ~/dot/scripts/setup/symlink.sh --themed-only

# apply theme
i3-msg restart
killall dunst
wait
dunst &

sleep 0.33
eval "$render --brightness 1"
