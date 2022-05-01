# default editor
set -gx EDITOR micro

# aliases
alias vi="~/.local/bin/lvim"
alias c="clear"
alias x="cd; startx"
alias dotsym="bash ~/dot/scripts/setup/symlink.sh"
alias dotsync="bash ~/dot/scripts/sync/sync.sh"
alias clean-symlinks="find . -xtype l -delete"
alias m="micro"
alias tra="python ~/dot/scripts/user/tra.py"
alias ttt="tt -blockcursor -notheme -showwpm -bold -words 200en -highlight1"
alias gsync="bash ~/dot/scripts/user/gitsync.sh $1"

# no greeting
set fish_greeting

################################################################## SPARU
# quick download using paru (with --skipreview and --noconfirm)
##################################################################
function sparu
    if count $argv >/dev/null
        paru -S $argv --cleanafter --removemake --useask --skipreview --noconfirm --needed
    else
        paru --skipreview --noconfirm -Syu
    end
end

################################################################## CPARU
# clear orphaned packages
##################################################################
function cparu
    echo "Searching for orphaned packages..."
    paru --skipreview --noconfirm --cleanafter -Rs $(paru -Qqtd)
    echo "Done."
end

################################################################## RPARU
# quickly remove packages using paru
##################################################################
function rparu
    if count $argv >/dev/null
        paru -Rs $argv --skipreview --noconfirm --cleanafter --removemake
    else
        echo "specify a package to remove"
    end
end

################################################################## CLONE
# clones a git repository from the defaut user's github (baris-inandi)
##################################################################
function clone -a name
    python ~/dot/scripts/user/gitclone.py $name
end

################################################################## VS
# opens vscode in the current directory and exits immediately
##################################################################
function vs
    bash ~/dot/scripts/user/vs.sh $argv
    exit
end

################################################################## CLEARCACHE
# clears .cache directory and runs paccache -r
##################################################################
function clearcache
    paccache -r
    rm -rf ~/.cache
    mkdir ~/.cache
    echo "cache cleared."
end

################################################################## MK
# creates and cds into a directory
##################################################################
function mk -a dir
    mkdir $dir
    cd $dir
end

################################################################## RMTHIS
# uses trash-cli to trash current directory and cds to parent
##################################################################
function rmthis
    set thisdir (basename $PWD)
    cd ..
    trash $thisdir
end

################################################################## LS
# replaces ls with exa, falls back to ls
##################################################################
function ls -a d
    bash ~/dot/scripts/user/ls.sh $d
end

################################################################## LSX
# treeview exa
##################################################################
function lsx -a d
    exa --group-directories-first --icons -laFh --git --no-filesize --no-permissions --no-user --no-time --tree --level 99 $d
end

################################################################## D
# cds into directory and calls ls immediately
##################################################################
function d -a dir
    cd $dir
    ls
end

################################################################## MVTHIS
# cds into directory and calls ls immediately
##################################################################
function mvthis -a name
    set thisdir (basename $PWD)
    cd ..
    mv $thisdir $name
    cd $name
end

# web shortcuts for fish

function classroom
    google-chrome-beta --new-window "https://classroom.google.com/u/1/h"
    exit
end

function github -a repo
    google-chrome-beta https://github.com/baris-inandi/$repo
end

function monk
    google-chrome-beta --new-window https://monkeytype.com
    exit
end
