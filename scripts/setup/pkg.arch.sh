# the arch package install script

# symlink pacman configs
sudo ln -f -s ~/dot/config/pacman.conf /etc/pacman.conf

# init pacman
sudo pacman -Syu
wait
sudo pacman -S --needed base-devel
wait

install_paru() {
  # install paru helper
  git clone https://aur.archlinux.org/paru.git
  wait
  cd paru
  wait
  makepkg -si
  wait
  # configure paru
  mkdir -p ~/.config/paru/
  ln -f -s ~/dot/config/paru.conf ~/.config/paru/paru.conf
  cd ~
}

# install rust before installing paru
sudo pacman -S --needed rustup
wait
rustup install stable
wait
rustup default stable
wait

echo "Installing paru"
if ! command -v paru &>/dev/null; then
  install_paru
fi
wait

# cleanup
rm -rf ./paru
wait

# installs essential packages
paru -S --skipreview --needed - <~/dot/pkglist

# install cpu microcodes
cpu_model_str=$(cat /proc/cpuinfo | grep 'model name' | uniq | tr '[:upper:]' '[:lower:]')
if [[ "$cpu_model_str" == *"amd"* ]]; then
  paru -S --skipreview --noconfirm --needed amd-ucode
elif [[ "$cpu_model_str" == *"intel"* ]]; then
  paru -S --skipreview --noconfirm --needed intel-ucode
fi

# install desired python modules
pip3 install dbus-python py3status requests grequests clipboard

# install pnpm
sudo npm i -g pnpm
