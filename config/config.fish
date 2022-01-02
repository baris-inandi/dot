function gsync -a name ; bash ~/dot/scripts/user/fish/gitsync.sh $name ; end
function clone -a name ; bash ~/dot/scripts/user/fish/gitclone.sh $name ; end
function vs -a vsdir ; bash ~/dot/scripts/user/fish/vs.sh $vsdir ; exit ; end
function ttt ; tt -blockcursor -notheme -showwpm -bold -words 200en -highlight1 ; end
function c ; clear ; end
function mk -a dir ; mkdir $dir ; cd $dir ; end

# web shortcuts
function classroom ; firefox "https://classroom.google.com/u/1/h" ; exit ; end
function github -a repo ; firefox https://github.com/baris-inandi/$repo ; end
function monk ; firefox --kiosk --new-window https://monkeytype.com ; exit ; end

set -gx EDITOR micro

if status is-interactive
    # Commands to run in interactive sessions can go here
end
