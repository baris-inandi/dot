# default editor
set -gx EDITOR micro

# aliases
alias c="clear"
alias x="cd; startx"
alias dotsym="bash ~/dot/scripts/setup/symlink.sh"
alias dotsync="bash ~/dot/scripts/sync/sync.sh"
alias clean-symlinks="find . -xtype l -delete"
alias m="micro"
alias tra="python ~/dot/scripts/user/tra.py"
alias ttt="tt -blockcursor -notheme -showwpm -bold -words 200en -highlight1"
alias gsync="bash ~/dot/scripts/user/gsync.sh $1"
alias npm="pnpm"
alias npx="pnpm dlx"
alias wei="python ~/dot/scripts/user/wei.py"
alias py="python ~/dot/scripts/user/pyeval.py"
alias eth="echo -n 0x92e937B42208c355CAA7C7aE4699613B6C3C2EbD | xclip -sel clip"
alias htop="btop"
alias fparu="paru --skipreview --noconfirm --needed --ignore=linux,linux-headers,grub -Syu"
alias qparu="paru -Qs $argv"

# no greeting
set fish_greeting

################################################################## RQPARU
# Remove Queried packages using paru
##################################################################
function rqparu
    set targets (paru -Qqs $argv)
    if test -n "$targets"
        paru -Rs $targets --skipreview --cleanafter --removemake
    else
        echo "Query returned no results."
        return 1
    end
end

################################################################## P
# Repeat previous command
##################################################################
function p
    set idx 1
    set prefix "sudo "
    if [ "$argv" != su ]
        set prefix ""
    end
    while true
        set cmd "$history[$idx]"
        set cmd_base "$(echo "$cmd" | head -n1 | cut -d " " -f1)"
        if [ "$cmd_base" != "$_" ]
            set prefixed_cmd "$prefix$cmd"
            echo "Running command: \"$prefixed_cmd\""
            eval "$prefixed_cmd"
            break
        else
            set idx (math $idx + 1)
        end
    end
end

################################################################## GPULL
# async git pull
##################################################################
function gpull
    bash ~/dot/scripts/user/gpull.sh &
end

################################################################## SPARU
# quick download using paru (with --skipreview and --noconfirm)
##################################################################
function sparu
    if count $argv >/dev/null
        paru -S $argv --removemake --useask --skipreview --noconfirm --needed
    else
        paru --skipreview --noconfirm --needed -Syu
    end
end

################################################################## RPARU
# quickly remove packages using paru
##################################################################
function rparu
    if count $argv >/dev/null
        paru -Rs $argv --skipreview --noconfirm --cleanafter --removemake
    else
        paru --skipreview --noconfirm --cleanafter -Rs $(paru -Qqtd)
        echo "Done."
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
    if not test -d $dir
        echo (set_color red)ERROR:(set_color normal) Directory non-existent
        return 1
    end
    cd $dir
    if [ "$PWD" = "$HOME" ]
        echo (set_color cyan)d:(set_color normal) Home directory
    else
        echo (set_color cyan)d:(set_color normal) $PWD
        ls
    end
end

################################################################## MVTHIS
# moves current directory
##################################################################
function mvthis -a name
    set thisdir (basename $PWD)
    cd ..
    mv $thisdir $name
    cd $name
end

# web shortcuts for fish

function classroom
    google-chrome-unstable --new-window "https://classroom.google.com/u/1/h"
    exit
end

function github -a repo
    google-chrome-unstable https://github.com/baris-inandi/$repo
    exit
end

function monk
    google-chrome-unstable --new-window https://monkeytype.com
    exit
end

set -gx PNPM_HOME "/home/bi/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
