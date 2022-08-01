# the arch package install script

# init pacman
sudo pacman -Syu
sudo pacman -S --needed base-devel

install_paru() {
  # install paru helper
  git clone https://aur.archlinux.org/paru.git
  wait
  cd paru
  wait
  makepkg -si
  wait
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

paru -S --skipreview --needed fe
sudo fe cf
fe in -f ~/dot/pkglist

# install cpu microcodes
cpu_model_str=$(cat /proc/cpuinfo | grep 'model name' | uniq | tr '[:upper:]' '[:lower:]')
if [[ "$cpu_model_str" == *"amd"* ]]; then
  fe in amd-ucode
elif [[ "$cpu_model_str" == *"intel"* ]]; then
  fe in intel-ucode
fi

# install desired python modules
pip3 install dbus-python py3status requests grequests clipboard

# install pnpm
sudo npm i -g pnpm
