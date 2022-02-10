#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
color=$(tput setaf 5)
white=$(tput sgr0)

printf "\n"

printf "${bold}${color}GITCLONE:${white} Cloning repo...\n\n${normal}"
git clone --depth 1 https://github.com/baris-inandi/$1
