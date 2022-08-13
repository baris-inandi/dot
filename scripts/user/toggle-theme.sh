t=$(cat ~/.config/dot-theme)

render=$(python3 ~/dot/scripts/user/render.py)

eval "$render --brightness 0"

if [ "$t" == "dark" ]; then
  t="light"
else
  t="dark"
fi

# save preference
echo $t >~/.config/dot-theme

# symlink dotfiles
source ~/dot/scripts/setup/symlink.sh --themed-only

# apply theme
i3-msg restart
killall dunst
wait
dunst &

sleep 0.2
eval "$render --brightness 1"
