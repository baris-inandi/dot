#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
green=`tput setaf 2`
white=`tput sgr0`

printf "\n"

printf "${bold}${green}GITSYNC:${white} Pulling from remote...\n\n${normal}"
git pull

printf "${bold}${green}GITSYNC:${white} Adding all changes...\n\n${normal}"
git add -A

printf "${bold}${green}GITSYNC:${white} Committing...\n\n${normal}"
git commit -am "$1"

printf "${bold}${green}GITSYNC:${white} Pushing...\n\n${normal}"
git push

printf "${bold}${green}REPO SYNCED${white}\n${normal}"
