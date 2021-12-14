cd ~/dot
echo | git diff
if [[ $(git diff) = "" ]]; then git pull fi
cd ~
