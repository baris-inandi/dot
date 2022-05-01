async() {
    if [ -d .git ]; then
        if [ -z "$1" ]; then
            cm=commit
        else
            cm="$1"
        fi

        notify-send "GSY" "Syncing $PWD"
        notify-send "git add -A" "$(git add -A)"
        notify-send "git commit -am $cm" "$(git commit -am $cm)"
        git push
        notify-send "Synced $PWD" "Repo currently at $(git rev-parse --short HEAD)"

    else
        notify-send "GSY FATAL" "Not a git repo"
    fi
}
# test
nohup "$(async)" >/dev/null 2>&1
