notify-send "GPULL" "Pulling $PWD"
nohup notify-send -t 7000 "GPULL $PWD" "$(git pull)" >/dev/null 2>&1
