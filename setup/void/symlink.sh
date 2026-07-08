symlink() {
    local source=$1
    local target=$2
    local target_dir

    target_dir=$(dirname "$target")
    mkdir -p "$target_dir"
    ln -fs "$source" "$target"
}

symlink ~/dot/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
symlink ~/dot/config/xorg/.xinitrc ~/.xinitrc
symlink ~/dot/config/xorg/.Xresources ~/.Xresources
