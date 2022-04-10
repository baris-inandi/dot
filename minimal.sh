# the arch package install script

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
  cd ~
}

# install rust before installing paru
sudo pacman -S --needed rust
wait

echo "Installing paru"
if ! command -v paru &>/dev/null; then
  install_paru
fi
wait

# cleanup
rm -rf ~/paru
wait

# installs essential packages

paru -S --skipreview --noconfirm --needed \
  bash \
  fish \
  nano \
  micro \
  translate-shell \
  sudo \
  unrar \
  unzip \
  wget \
  curl \
  chromium \
  spotify \
  visual-studio-code-bin \
  trash-cli \
  speedtest-cli \
  github-cli \
  bat \
  neofetch \
  git-delta-git \
  fzf \
  exa \
  catimg \
  ttf-ms-fonts \
  ttf-rubik \
  otf-ibm-plex \
  ttf-fira-sans \
  ttf-fira-mono \
  ttf-fira-code \
  ttf-iosevka-nerd \
  ttf-droid \
  ttf-dejavu \
  inter-font \
  ttf-roboto \
  noto-fonts \
  ttf-jetbrains-mono \
  nerd-fonts-jetbrains-mono \
  ttf-lato \
  ttf-liberation \
  onlyoffice-desktopeditors

# install cpu microcodes
cpu_model_str=$(cat /proc/cpuinfo | grep 'model name' | uniq | tr '[:upper:]' '[:lower:]')
if [[ "$cpu_model_str" == *"amd"* ]]; then
  sudo pacman -S amd-ucode
elif [[ "$cpu_model_str" == *"intel"* ]]; then
  sudo pacman -S intel-ucode
fi

# install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

mkdir -p ~/.config/fish/conf.d
cp ~/dot/scripts/user/fish_config/config.fish ~/.config/fish/conf.d/config.fish
cp ~/dot/scripts/user/fish_config/web.fish ~/.config/fish/conf.d/web.fish
