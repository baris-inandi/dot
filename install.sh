# install paru helper
sudo pacman -Sy
wait
sudo pacman -S --needed base-devel
wait
git clone https://aur.archlinux.org/paru.git
wait
cd paru
wait
makepkg -si
wait

# download and install all fonts + postinstall packages
paru -S --noreview --noconfirm < ./pkg/font
wait
paru -S --noreview --noconfirm < ./pkg/postinstall
wait

# zsh as deafult shell
chsh --shell /usr/bin/zsh
wait

# symlinks
ln -f -s ~/dot/i3 ~/.config/i3/config
ln -f -s ~/dot/kitty.conf ~/.config/kitty/kitty.conf
ln -f -s ~/dot/.gitconfig ~/.gitconfig
ln -f -s ~/dot/.zshrc ~/.zshrc

wait

# configure keyboard layout
sudo cp -f ~/dot/vconsole.conf /etc/vconsole.conf
wait

# default wallpaper
cp -f ~/dot/wallpaper.png ~/Pictures/wallpaper.png
wait

# update everything
paru
wait

# restart
sudo reboot
