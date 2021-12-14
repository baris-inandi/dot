function gsync -a name ; sh ~/dot/scripts/user/gitsync.sh $name ; end
function clone -a name ; sh ~/dot/scripts/user/gitclone.sh $name ; end
function vs ; code . && exit ; end
function github -a repo ; firefox https://github.com/baris-inandi/$repo ; end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
