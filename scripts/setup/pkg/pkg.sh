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

paru -S --skipreview --noconfirm --needed \
  bash \
  rofi \
  rofi-emoji \
  fish \
  picom-jonaburg-git \
  betterlockscreen \
  nano \
  micro \
  translate-shell \
  python \
  python-pip \
  python-poetry \
  npm \
  pfetch \
  sudo \
  nautilus \
  unzip \
  wget \
  curl \
  xidlehook \
  firefox \
  spotify \
  visual-studio-code-bin \
  go \
  ranger \
  trash-cli \
  hollywood \
  speedtest++ \
  alacritty \
  github-cli \
  alsa-utils \
  i3-gaps \
  xclip \
  maim \
  bat \
  cowsay \
  feh \
  libnotify \
  dunst \
  brightnessctl \
  playerctl \
  neofetch \
  pyenv \
  gnome-keyring \
  libsecret \
  libgnome-keyring \
  seahorse \
  pm-utils \
  git-delta-git \
  fzf \
  exa \
  xmousepasteblock-git \
  py3status \
  python-pipenv \
  xss-lock \
  catimg \
  ttf-ms-fonts \
  ttf-apple-emoji \
  ttf-rubik \
  otf-ibm-plex \
  ttf-fira-sans \
  ttf-fira-mono \
  ttf-fira-code \
  ttf-iosevka-nerd \
  inter-font \
  ttf-roboto \
  noto-fonts \
  adobe-source-code-pro-fonts \
  ttf-inconsolata \
  ttf-jetbrains-mono \
  nerd-fonts-jetbrains-mono \
  ttf-lato \
  onlyoffice-bin \
  ttt \
  gnome-font-viewer \
  gnome-control-center

# install cpu microcodes
cpu_model_str=$(cat /proc/cpuinfo | grep 'model name' | uniq | tr '[:upper:]' '[:lower:]')
if [[ "$cpu_model_str" == *"amd"* ]]; then
  sudo pacman -S amd-ucode
elif [[ "$cpu_model_str" == *"intel"* ]]; then
  sudo pacman -S intel-ucode
fi

# install desired python modules
pip3 install dbus-python py3status
