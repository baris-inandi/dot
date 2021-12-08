#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
green=`tput setaf 2`
white=`tput sgr0`

printf "\n"

printf "${bold}${green}GITCLONE:${white} Cloning repo...\n\n${normal}"
git clone --depth 1 https://github.com/baris-inandi/$1
