t=$(cat ~/.config/dot-theme)

#### Themed symlinks ####

mkdir -p ~/.config/alacritty
ln -f -s ~/dot/config/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -f -s ~/dot/config/alacritty-colors.$t.yml ~/.config/alacritty/colors.yml

mkdir -p ~/.config/micro/colorschemes
ln -f -s ~/dot/config/dot.$t.micro ~/.config/micro/colorschemes/dot.micro

mkdir -p ~/.config/dunst
ln -f -s ~/dot/config/dunstrc.$t.conf ~/.config/dunst/dunstrc

mkdir -p ~/.config/i3
ln -f -s ~/dot/config/i3/colors.$t.i3 ~/.config/i3/colors

ln -f -s ~/dot/config/wallpaper.$t.png ~/.config/wallpaper.png

mkdir -p ~/.config/i3status
ln -f -s ~/dot/config/i3status.$t.conf ~/.config/i3status/config

if [ "$1" == "--themed-only" ]; then
  return
fi

#### Non-themed symlinks ####

mkdir -p ~/.config/i3
ln -f -s ~/dot/config/i3/config.i3 ~/.config/i3/config

ln -f -s ~/dot/config/.gitconfig ~/.gitconfig

mkdir -p ~/.config/micro/
ln -f -s ~/dot/config/micro.json ~/.config/micro/settings.json

mkdir -p ~/.cspell
ln -f -s ~/dot/config/cspell-dictionary.txt ~/.cspell/custom-dictionary-user.txt

mkdir -p ~/.config/gtk-3.0/
ln -f -s ~/dot/config/gtksettings.ini ~/.config/gtk-3.0/settings.ini

ln -f -s ~/dot/config/.Xresources ~/.Xresources

ln -f -s ~/dot/config/.xinitrc ~/.xinitrc

ln -f -s ~/dot/config/betterlockscreenrc.conf ~/.config/betterlockscreenrc

mkdir -p ~/.config/fish/
ln -f -s ~/dot/config/config.fish ~/.config/fish/config.fish

mkdir -p ~/.config/rofi
ln -f -s ~/dot/config/config.rasi ~/.config/rofi/config.rasi

mkdir -p ~/.config/paru/
ln -f -s ~/dot/config/paru.conf ~/.config/paru/paru.conf
ln -f -s ~/dot/config/pacman.conf ~/.config/paru/pacman.conf

# firefox config symlinks
mkdir -p ~/.mozilla/firefox/personal/chrome
ln -f -s ~/dot/config/firefox/personal/chrome/userChrome.css ~/.mozilla/firefox/personal/chrome/userChrome.css
ln -f -s ~/dot/config/firefox/personal/chrome/userContent.css ~/.mozilla/firefox/personal/chrome/userContent.css
ln -f -s ~/dot/config/firefox/personal/user.js ~/.mozilla/firefox/personal/user.js
