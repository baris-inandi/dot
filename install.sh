cd ~
wait

# init pacman
sudo pacman -Sy
wait
sudo pacman -S --needed base-devel
wait

# desktop manager
systemctl enable gdm
wait

# install microcode
# sudo pacman -S intel-ucode
# sudo pacman -S amd-ucode

install_paru()
{
  # install paru helper
  git clone https://aur.archlinux.org/paru.git
  wait
  cd paru
  wait
  makepkg -si
  wait
  cd ~
}

paru || install_paru
wait

# download and install all fonts + postinstall packages
paru -S - --skipreview --noconfirm < ~/dot/pkg/postinstall
wait
paru -S - --skipreview --noconfirm < ~/dot/pkg/font
wait

# fish as deafult shell
chsh --shell /usr/bin/fish
wait

# symlinks
ln -f -s ~/dot/i3 ~/.config/i3/config
ln -f -s ~/dot/kitty.conf ~/.config/kitty/kitty.conf
ln -f -s ~/dot/.gitconfig ~/.gitconfig
ln -f -s ~/dot/.zshrc ~/.zshrc
wait

# hosts
sudo cp -f ~/dot/hosts /etc/hosts

# configure keyboard layout
sudo cp -f ~/dot/vconsole.conf /etc/vconsole.conf
wait

# default wallpaper
cp -f ~/dot/wallpaper.png ~/Pictures/wallpaper.png
wait

# post install configs
timectl set-timezone Europe/Istanbul
systemctl enable systemd-timesyncd
hostnamectl set-hostname baris-arch

# update everything
paru
wait

# restart
sudo reboot
