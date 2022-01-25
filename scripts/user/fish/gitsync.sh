#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
white=$(tput sgr0)

if [ -z "$1" ]; then
  cm=commit
else
  cm="$1"
fi

printf "${bold}${green}GSYNC:${white} Syncing \"$cm\"\n${normal}"

printf "${bold}${green}GSYNC:${white} Pulling from remote...\n${normal}"
git pull

printf "${bold}${green}GSYNC:${white} Adding all changes...\n${normal}"
git add -A

printf "${bold}${green}GSYNC:${white} Committing...\n${normal}"
git commit -am "$cm"

printf "${bold}${green}GSYNC:${white} Pushing...\n${normal}"
git push

printf "${bold}${green}REPO SYNCED${white}\n${normal}"
