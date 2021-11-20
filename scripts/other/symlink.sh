# symlinks

mkdir -p ~/.config/i3
ln -f -s ~/dot/i3 ~/.config/i3/config

mkdir -p ~/.config/i3status
ln -f -s ~/dot/i3status ~/.config/i3status/config

mkdir -p ~/.config/kitty
ln -f -s ~/dot/kitty.conf ~/.config/kitty/kitty.conf

ln -f -s ~/dot/.gitconfig ~/.gitconfig

mkdir -p ~/.config/micro/colorschemes
ln -f -s ~/dot/theme.micro ~/.config/micro/colorschemes/theme.micro

mkdir -p ~/.config/micro/
ln -f -s ~/dot/micro.json ~/.config/micro/settings.json

mkdir -p ~/.config/dunst
ln -f -s ~/dot/dunstrc ~/.config/dunst/dunstrc
