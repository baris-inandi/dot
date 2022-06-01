# default editor
set -gx EDITOR micro

# aliases
alias c="clear"
alias x="cd; startx"
alias dotsym="bash ~/dot/scripts/setup/symlink.sh"
alias dotsync="bash ~/dot/scripts/sync/sync.sh"
alias dotpush="cd ~/dot/; gsync"
alias clean-symlinks="find . -xtype l -delete"
alias m="micro"
alias tra="luajit ~/dot/scripts/user/tra.lua"
alias ttt="tt -blockcursor -notheme -showwpm -bold -words 200en -highlight1"
alias gsync="bash ~/dot/scripts/user/gsync.sh $1"
alias npm="pnpm"
alias npx="pnpm dlx"
alias wei="luajit ~/dot/scripts/user/wei.lua"
alias eth="echo -n 0x92e937B42208c355CAA7C7aE4699613B6C3C2EbD | xclip -sel clip"
alias htop="btop"
alias fparu="paru --skipreview --noconfirm --needed --ignore=linux,linux-headers,grub -Syu"
alias qparu="paru -Qs $argv"
alias code="code-insiders"
alias clone="luajit ~/dot/scripts/user/gitclone.lua"
alias ls="bash ~/dot/scripts/user/ls.sh $argv"
alias lsx="exa --group-directories-first --icons -laFh --git --no-filesize --no-permissions --no-user --no-time --tree --level 99 $argv"

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

################################################################## VS
# opens vscode in the current directory and exits immediately
##################################################################
function vs
    if count $argv >/dev/null
        code $argv
    else
        code .
    end
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

set -gx PNPM_HOME "/home/bi/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
