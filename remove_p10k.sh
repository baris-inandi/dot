#!/usr/bin/env sh

set -eu

dry_run=0
backup=0

usage() {
    echo "Usage: $0 [--dry-run] [--backup]"
    echo
    echo "Removes powerlevel10k/p10k files and scrubs p10k references from shell startup files."
    echo "By default, edited files are changed in place. Use --backup to keep timestamped copies."
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        -n|--dry-run)
            dry_run=1
            ;;
        --backup)
            backup=1
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
    shift
done

timestamp=$(date +%Y%m%d%H%M%S)
cache_home=${XDG_CACHE_HOME:-"$HOME/.cache"}
zdotdir=${ZDOTDIR:-"$HOME"}
zsh_custom=${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)

run() {
    if [ "$dry_run" -eq 1 ]; then
        printf 'would run:'
        for arg in "$@"; do
            printf ' %s' "$arg"
        done
        printf '\n'
    else
        "$@"
    fi
}

remove_path() {
    path=$1
    if [ -e "$path" ] || [ -L "$path" ]; then
        echo "Removing $path"
        run rm -rf "$path"
    fi
}

remove_glob() {
    for path in "$@"; do
        if [ -e "$path" ] || [ -L "$path" ]; then
            remove_path "$path"
        fi
    done
}

clean_file() {
    file=$1

    [ -f "$file" ] || return 0

    tmp=$(mktemp "${TMPDIR:-/tmp}/remove_p10k.XXXXXX")

    awk '
        BEGIN {
            skip_instant_prompt = 0
        }
        {
            lower = tolower($0)

            if (skip_instant_prompt) {
                if ($0 ~ /^[[:space:]]*fi[[:space:]]*$/) {
                    skip_instant_prompt = 0
                }
                next
            }

            if (lower ~ /enable powerlevel10k instant prompt/) {
                skip_instant_prompt = 1
                next
            }

            if (lower ~ /p10k|powerlevel10k|powerlevel9k/) {
                next
            }

            if ($0 ~ /POWERLEVEL[0-9]+K/) {
                next
            }

            print
        }
    ' "$file" > "$tmp"

    if cmp -s "$file" "$tmp"; then
        rm -f "$tmp"
        return 0
    fi

    echo "Cleaning $file"
    if [ "$dry_run" -eq 1 ]; then
        rm -f "$tmp"
        return 0
    fi

    if [ "$backup" -eq 1 ]; then
        cp -p "$file" "$file.pre-p10k-removal.$timestamp"
    fi
    cat "$tmp" > "$file"
    rm -f "$tmp"
}

remove_path "$HOME/powerlevel10k"
remove_path "$HOME/.powerlevel10k"
remove_path "$HOME/.p10k.zsh"
remove_path "$HOME/.p10k.zsh.zwc"

if [ "$zdotdir" != "$HOME" ]; then
    remove_path "$zdotdir/.p10k.zsh"
    remove_path "$zdotdir/.p10k.zsh.zwc"
fi

remove_path "$zsh_custom/themes/powerlevel10k"
remove_path "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
remove_path "$HOME/.antigen/bundles/romkatv/powerlevel10k"
remove_path "$HOME/.zinit/plugins/romkatv---powerlevel10k"
remove_path "$HOME/.local/share/zinit/plugins/romkatv---powerlevel10k"
remove_path "$HOME/.local/share/antibody/bundles/romkatv/powerlevel10k"

remove_glob "$cache_home"/p10k-*

if [ "$cache_home" != "$HOME/.cache" ]; then
    remove_glob "$HOME/.cache"/p10k-*
fi

clean_file "$script_dir/config/zsh/.zshrc"
clean_file "$script_dir/setup/base/packages.sh"

clean_file "$HOME/.zshrc"
clean_file "$HOME/.zprofile"
clean_file "$HOME/.zshenv"
clean_file "$HOME/.profile"
clean_file "$HOME/.bashrc"
clean_file "$HOME/.bash_profile"
clean_file "$HOME/.config/zsh/.zshrc"

if [ "$zdotdir" != "$HOME" ]; then
    clean_file "$zdotdir/.zshrc"
    clean_file "$zdotdir/.zprofile"
    clean_file "$zdotdir/.zshenv"
fi

echo "p10k cleanup complete."
