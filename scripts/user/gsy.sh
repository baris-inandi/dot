if [ -d .git ]; then
    if [ -z "$1" ]; then
        cm=commit
    else
        cm="$1"
    fi
    notify-send -t 50000 "GSY" "Syncing $PWD"
    notify-send -t 50000 "git add -A" "$(git add -A)"
    notify-send -t 50000 "git commit -am $cm" "$(git commit -am $cm)"
    notify-send -t 50000 "Syncing $PWD" "$(git push)" &
    notify-send -t 50000 "Synced $PWD" "Repo currently at $(git rev-parse --short HEAD)" >/dev/null 2>&1 &
else
    notify-send "GSY FATAL" "Not a git repo"
fi
