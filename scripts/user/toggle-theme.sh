python3 ~/dot/scripts/user/render.py --black

touch ~/.config/dot-theme
t=$(cat ~/.config/dot-theme)

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

sleep 0.33
python3 ~/dot/scripts/user/render.py
