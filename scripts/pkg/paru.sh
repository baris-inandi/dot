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

# configure rustup toolchain
rustup install stable
wait
rustup default stable
wait

echo "Installing paru"
install_paru
wait

# cleanup
rm -rf ~/paru
wait