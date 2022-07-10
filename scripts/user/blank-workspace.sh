current_ws=$(i3-msg -t get_workspaces |
  jq '.[] | select(.focused==true).name' |
  cut -d"\"" -f2)

r=$(shuf -i 100-999 -n 1)
i3-msg "workspace --no-auto-back-and-forth $r"
