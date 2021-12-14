cd ~/dot
if [[ $(git diff) = "" ]]; then
	notify-send "Updating dot" "Your dotfiles are unchanged locally, syncing it from the remote"
	git pull
fi
cd ~
