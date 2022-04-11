# default editor
set -gx EDITOR micro
# aliases
alias vi="~/.local/bin/lvim"
alias c="clear"
# no greeting
set fish_greeting

################################################################ GSYNC
# pulls, adds, commits, and pushes all files in a git repo
##################################################################
function gsync -a name
    bash ~/dot/scripts/user/fish/gitsync.sh $name
end

################################################################## SPARU
# quick download using paru (with --skipreview and --noconfirm)
##################################################################
function sparu
    if count $argv >/dev/null
        paru -S $argv --cleanafter --removemake --useask --sudoloop --skipreview --noconfirm --needed
    else
        paru --skipreview --noconfirm -Syu
    end
end


################################################################## RPARU
# quickly remove packages using paru
##################################################################
function rparu
    if count $argv >/dev/null
        paru -R $argv --skipreview --noconfirm --sudoloop --cleanafter --removemake
    else
        echo "specify a package to remove"
    end
end

################################################################## CLONE
# clones a git repository from the defaut user's github (baris-inandi)
##################################################################
function clone -a name
    bash ~/dot/scripts/user/fish/gitclone.sh $name
    wait
    cd $name
end

################################################################## VS
# opens vscode in the current directory and exits immediately
##################################################################
function vs
    bash ~/dot/scripts/user/fish/vs.sh $argv
    exit
end

################################################################## TTT
# tt typing test with custom config
##################################################################
function ttt
    tt -blockcursor -notheme -showwpm -bold -words 200en -highlight1
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
    bash ~/dot/scripts/user/fish/ls.sh $d
end

################################################################## LSX
# treeview exa
##################################################################
function lsx -a d
    exa --group-directories-first --icons -laFh --git --no-filesize --no-permissions --no-user --no-time --tree --level 99
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

################################################################## DOTSYNC
# syncs dot on-demand
##################################################################
function dotsync
    bash ~/dot/scripts/sync/sync.sh
end
