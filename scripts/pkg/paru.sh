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

# install rust before installing paru
sudo pacman -S --needed rust
wait

# uncomment if using rustup instead of rust
# configure rustup toolchain
# rustup install stable
# wait
# rustup default stable
# wait

echo "Installing paru"
if ! command -v paru &> /dev/null
then install_paru fi
wait

# cleanup
rm -rf ~/paru
wait