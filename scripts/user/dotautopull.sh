cd ~/dot
if [[ $(git diff) = "" ]]; then
  local_hash=`git rev-parse --short --verify HEAD`
  notify-send "Updating dot" "Your dotfiles are unchanged locally, syncing it from the remote..."
  git pull
  new_hash=`git rev-parse --short --verify HEAD`
  if [[ "$local_hash" == "$new_hash" ]]; then
  	notify-send "Updated dot" "dot is currently at $new_hash"
  fi
fi
cd ~
