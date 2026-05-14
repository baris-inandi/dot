# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##################################################################
# CUSTOM CONFIG
##################################################################

export EDITOR="micro"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HOMEBREW_NO_AUTO_UPDATE=1

PATH+="$HOME/.cargo/bin"
PATH+="$HOME/.local/bin"
PATH+="$HOME/.flutter-sdk/bin"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# aliases
alias xt="exit"
alias c="clear"
alias m="micro"
alias gsync="bash ~/dot/scripts/gsync.sh $@"
alias greset="git add . && git reset --hard"
alias giff="git diff"
alias clone="bash ~/dot/scripts/gitclone.sh $@"
alias ls="lsd -la $argv --config-file ~/dot/config/lsd/lsd.yml"
alias root="cd /"
alias mm="$EDITOR (sk --preview='bat {} --color=always')"
alias clean_node_modules="find ~/me -name node_modules -type d -prune -exec trash {} +"
alias ..="cd .."
alias cd..="cd .."

################################################################## CLEARCACHE
# Clears .cache directory and runs paccache -r
##################################################################
function clearcache {
    rm -rf ~/.cache
    mkdir ~/.cache
    echo "cache cleared."
}

################################################################## MK
# Creates and cds into a directory
##################################################################
function mk {
    mkdir "$1"
    cd "$1"
}

################################################################## RMTHIS
# Uses trash-cli to trash current directory and cds to parent
##################################################################
function rmthis {
    thisdir=$(basename "$PWD")
    cd ..
    trash "$thisdir"
}

################################################################## D
# Cds into directory and calls ls immediately
##################################################################
function d {
    if [ -z "$1" ]; then
        cd
        return 0
    fi
    if [ ! -d "$1" ]; then
        echo "\033[31mERROR:\033[0m Directory non-existent"
        return 1
    fi
    cd "$1"
    if [ "$1" = "$HOME" ]; then
        echo "\033[36md:\033[0m Home directory"
    else
        echo "\033[36md:\033[0m $PWD"
        ls
    fi
}

################################################################## MVTHIS
# Moves current directory
##################################################################
function mvthis {
    thisdir=$(basename "$PWD")
    cd ..
    mv "$thisdir" "$1"
    cd "$1"
}

function brupdate {
    sudo echo "Starting full system update..."
    brew update
    brew upgrade --display-times

    if [[ "$1" == "--greedy" ]]; then
        echo "Upgrading packages greedily."
        brew upgrade --cask --display-times --greedy
    else
        echo "Upgrading packages non-greedily."
        brew upgrade --cask --display-times
    fi

    brew cleanup --prune=all -v
    brew doctor
    echo "Everything is up to date."
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# bun
[ -s "/Users/bi/.bun/_bun" ] && source "/Users/bi/.bun/_bun" # for completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#compdef opencode
###-begin-opencode-completions-###
_opencode_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" opencode --get-yargs-completions "${words[@]}"))
  IFS=$si
  if [[ ${#reply} -gt 0 ]]; then
    _describe 'values' reply
  else
    _default
  fi
}
if [[ "'${zsh_eval_context[-1]}" == "loadautofunc" ]]; then
  _opencode_yargs_completions "$@"
else
  compdef _opencode_yargs_completions opencode
fi
###-end-opencode-completions-###

export OPENCODE_EXPERIMENTAL_DISABLE_COPY_ON_SELECT=true
