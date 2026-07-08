symlink() {
    local source=$1
    local target=$2
    local target_dir

    target_dir=$(dirname "$target")
    mkdir -p "$target_dir"
    ln -fs "$source" "$target"
}

symlink ~/dot/config/git/.gitconfig ~/.gitconfig
symlink ~/dot/config/zsh/.zshrc ~/.zshrc
symlink ~/dot/config/micro/micro.json ~/.config/micro/settings.json
symlink ~/dot/config/micro/dot.micro ~/.config/micro/colorschemes/dot.micro
symlink ~/dot/config/lsd/lsd.yml ~/.config/lsd/config.yaml
symlink ~/dot/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
symlink ~/dot/config/starship/starship.toml ~/.config/starship.toml
symlink ~/dot/config/zed/settings.json ~/.config/zed/settings.json
