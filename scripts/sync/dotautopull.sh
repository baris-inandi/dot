#!/bin/bash

cd ~/dot
if [[ $(git diff) = "" ]]; then
  sleep 1
  # get data before git pull
  old_hash=$(git rev-parse --short --verify HEAD)
  old_sym=$(python3 ~/dot/scripts/sync/symlink_parse.py)
  git pull
  # get data after git pull
  new_hash=$(git rev-parse --short --verify HEAD)
  new_sym=$(python3 ~/dot/scripts/sync/symlink_parse.py)
  # see if data before and after are the same
  # notify user if git pull updated any dotfiles
  if [[ "$old_hash" != "$new_hash" ]]; then
    notify-send "Updated dot" "The system has auto-updated dotfiles. dot is currently at $new_hash"
  fi
  # notify user if git pull affected config symlinks
  if [[ "$old_sym" != "$new_sym" ]]; then
    notify-send "Changes in config symlinks detected." "Applying changes..."
    sleep 0.5
    bash ~/dot/refresh.sh
  fi
fi
cd ~
