current_ws=$(i3-msg -t get_workspaces |
  jq '.[] | select(.focused==true).name' |
  cut -d"\"" -f2)

if [ "$current_ws" = "⠀" ]; then
  i3-msg "workspace back_and_forth"
else
  i3-msg "workspace ⠀"
fi
