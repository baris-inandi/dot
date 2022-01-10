################################################################## GSYNC
# pulls, adds, commits, and pushes all files in a git repo
##################################################################
function gsync -a name
    bash ~/dot/scripts/user/fish/gitsync.sh $name
end

################################################################## SPARU
# quick download using paru (with --skipreview and --noconfirm)
##################################################################
function sparu
    if count $argv > /dev/null
        paru -S $argv --skipreview --noconfirm --needed
    else
        paru --skipreview --noconfirm -Syu
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
function vs -a vsdir
    bash ~/dot/scripts/user/fish/vs.sh $vsdir
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

################################################################## CL
# cds into directory and calls ls immediately
##################################################################
function cl -a d
    cd $d
    ls
end
