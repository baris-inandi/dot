# symlinks

mkdir -p ~/.config/i3
ln -f -s ~/dot/config/i3 ~/.config/i3/config

mkdir -p ~/.config/i3status
ln -f -s ~/dot/config/i3status.conf ~/.config/i3status/config

mkdir -p ~/.config/alacritty
ln -f -s ~/dot/config/alacritty.yml ~/.config/alacritty/alacritty.yml

ln -f -s ~/dot/config/.gitconfig ~/.gitconfig

mkdir -p ~/.config/micro/colorschemes
ln -f -s ~/dot/config/theme.micro ~/.config/micro/colorschemes/theme.micro

mkdir -p ~/.config/micro/
ln -f -s ~/dot/config/micro.json ~/.config/micro/settings.json

mkdir -p ~/.config/dunst
ln -f -s ~/dot/config/dunstrc.conf ~/.config/dunst/dunstrc

mkdir -p ~/.cspell
ln -f -s ~/dot/config/cspell-dictionary.txt ~/.cspell/custom-dictionary-user.txt

mkdir -p ~/.config/gtk-3.0/
ln -f -s ~/dot/config/gtksettings.ini ~/.config/gtk-3.0/settings.ini

ln -f -s ~/dot/config/.Xresources ~/.Xresources

ln -f -s ~/dot/config/.xinitrc ~/.xinitrc

ln -f -s ~/dot/config/betterlockscreenrc.conf ~/.config/betterlockscreenrc

mkdir -p ~/.config/fish/conf.d
ln -f -s ~/dot/config/config.fish ~/.config/fish/conf.d/config.fish

mkdir -p ~/.config/rofi
ln -f -s ~/dot/config/config.rasi ~/.config/rofi/config.rasi

mkdir -p ~/.config/systemd/user
ln -f -s ~/dot/config/eos-update.ini ~/.config/systemd/user/eos-update-notifier.timer

# firefox config symlinks
mkdir -p ~/.mozilla/firefox/personal/chrome
ln -f -s ~/dot/config/firefox/personal/chrome/userChrome.css ~/.mozilla/firefox/personal/chrome/userChrome.css
ln -f -s ~/dot/config/firefox/personal/chrome/userContent.css ~/.mozilla/firefox/personal/chrome/userContent.css
ln -f -s ~/dot/config/firefox/personal/user.js ~/.mozilla/firefox/personal/user.js
