#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
white=$(tput sgr0)

if [ -z "$1" ]; then
  echo
  echo "GITSYNC"
  echo "please specify a commit message."
  echo "usage: gitsync <COMMIT_MESSAGE>"
  echo
else
  printf "${bold}${green}GITSYNC:${white} Pulling from remote...\n${normal}"
  git pull

  printf "${bold}${green}GITSYNC:${white} Adding all changes...\n${normal}"
  git add -A

  printf "${bold}${green}GITSYNC:${white} Committing...\n${normal}"
  git commit -am "$1"

  printf "${bold}${green}GITSYNC:${white} Pushing...\n${normal}"
  git push

  printf "${bold}${green}REPO SYNCED${white}\n${normal}"

fi
