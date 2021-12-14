#!/bin/bash

cd ~/dot
if [[ $(git diff) = "" ]]; then
  sleep 1
  local_hash=`git rev-parse --short --verify HEAD`
  git pull
  new_hash=`git rev-parse --short --verify HEAD`
  if [[ "$local_hash" != "$new_hash" ]]; then
  	notify-send "Updated dot" "The system has auto-updated dotfiles. dot is currently at $new_hash"
  fi
fi
cd ~
