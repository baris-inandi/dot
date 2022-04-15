#!/bin/bash

cd ~/dot
if [[ $(git diff) = "" ]]; then
  sleep 1
  # get data before git pull
  old_hash=$(git rev-parse --short --verify HEAD)
  git pull
  # get data after git pull
  new_hash=$(git rev-parse --short --verify HEAD)
  # see if data before and after are the same
  # notify user if git pull updated any dotfiles
  if [[ "$old_hash" != "$new_hash" ]]; then
    notify-send "Updated dot" "The system has auto-updated dotfiles. dot is currently at $new_hash"
  fi
fi
cd ~
