#!/bin/bash

source ~/dot/scripts/color.sh

if [ "$#" -ne 2 ]; then
  printf "${bold}${blue}BRANCHOUT: Usage: branchout <branch1> <branch2>\n${normal}${white}"
  exit 1
fi

b1="$1"
b2="$2"

printf "${bold}${blue}BRANCHOUT: Fetching and pulling...\n${normal}${white}"
git fetch --all
git pull

printf "${bold}${blue}BRANCHOUT: Switching to \"$b1\"...\n${normal}${white}"
git checkout "$b1"

if git show-ref --verify --quiet "refs/heads/$b2"; then
  printf "${bold}${blue}BRANCHOUT: Switching to existing branch \"$b2\"...\n${normal}${white}"
  git checkout "$b2"
else
  printf "${bold}${blue}BRANCHOUT: Creating new branch \"$b2\"...\n${normal}${white}"
  git checkout -b "$b2"
fi

printf "\n${bold}${green}BRANCHED OUT from${normal}${white} $b1 ${bold}${green}to${normal}${white} $b2\n"
