# symlinks

mkdir -p ~/.config/i3
ln -f -s ~/dot/config/i3 ~/.config/i3/config

mkdir -p ~/.config/i3status
ln -f -s ~/dot/config/i3status.conf ~/.config/i3status/config

mkdir -p ~/.config/kitty
ln -f -s ~/dot/config/kitty.conf ~/.config/kitty/kitty.conf

ln -f -s ~/dot/config/.gitconfig ~/.gitconfig

mkdir -p ~/.config/micro/colorschemes
ln -f -s ~/dot/config/theme.micro ~/.config/micro/colorschemes/theme.micro

mkdir -p ~/.config/micro/
ln -f -s ~/dot/config/micro.json ~/.config/micro/settings.json

mkdir -p ~/.config/dunst
ln -f -s ~/dot/config/dunstrc.conf ~/.config/dunst/dunstrc

mkdir -p ~/.config/gtk-3.0/
ln -f -s ~/dot/config/gtksettings.ini ~/.config/gtk-3.0/settings.ini

ln -f -s ~/dot/config/X/.Xresources ~/.Xresources

ln -f -s ~/dot/config/X/.xinitrc ~/.xinitrc

ln -f -s ~/dot/config/betterlockscreenrc.conf ~/.config/betterlockscreenrc

mkdir -p ~/.config/fish
ln -f -s ~/dot/config/config.fish ~/.config/fish/config.fish

mkdir -p ~/.config/rofi
ln -f -s ~/dot/config/config.rasi ~/.config/rofi/config.rasi

mkdir -p ~/.config/systemd/user
ln -f -s ~/dot/config/eos-update.ini ~/.config/systemd/user/eos-update-notifier.timer

# py3status scripts
mkdir -p ~/.config/py3status/modules
ln -f -s ~/dot/scripts/user/py3status_modules/dotver.py ~/.config/py3status/modules/dotver.py

# firefox config symlinks
ln -f -s ~/dot/config/firefox/personal/chrome/userChrome.css ~/.mozilla/firefox/personal/chrome/userChrome.css
ln -f -s ~/dot/config/firefox/personal/chrome/userContent.css ~/.mozilla/firefox/personal/chrome/userContent.css
ln -f -s ~/dot/config/firefox/personal/user.js ~/.mozilla/firefox/personal/user.js
