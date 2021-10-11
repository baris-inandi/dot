# install paru helper
sudo pacman -Sy
sudo pacman -S paru

# download and install all fonts + postinstall packages
paru -S --noreview --noconfirm < ./pkg/font
paru -S --noreview --noconfirm < ./pkg/postinstall

# zsh as deafult shell
chsh --shell /usr/bin/zsh

# symlinks
ln -f -s ~/dot/i3config ~/.config/i3/config
ln -f -s ~/dot/kitty.conf ~/.config/kitty/kitty.conf
ln -f -s ~/dot/.gitconfig ~/.gitconfig
ln -f -s ~/dot/.zshrc ~/.zshrc

# update everything
paru