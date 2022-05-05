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

paru -S --skipreview --needed \
  bash \
  fish \
  rofi \
  rofi-emoji \
  picom-jonaburg-git \
  betterlockscreen \
  micro \
  translate-shell \
  python \
  python-pip \
  python-poetry \
  npm \
  pnpm \
  pfetch \
  iw \
  sudo \
  nautilus \
  unzip \
  xdotool \
  wget \
  curl \
  xidlehook \
  google-chrome-beta \
  gnome-themes-extra \
  spotify \
  visual-studio-code-bin \
  go \
  ranger \
  trash-cli \
  speedtest++ \
  alacritty \
  github-cli \
  alsa-utils \
  i3-gaps \
  i3status \
  xclip \
  maim \
  bat \
  feh \
  libnotify \
  dunst \
  brightnessctl \
  playerctl \
  neofetch \
  gnome-keyring \
  libsecret \
  libgnome-keyring \
  seahorse \
  pm-utils \
  git-delta \
  fzf \
  exa \
  acpi \
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
  ttf-fira-code \
  ttf-iosevka-nerd \
  inter-font \
  ttf-roboto \
  noto-fonts \
  adobe-source-code-pro-fonts \
  ttf-inconsolata \
  ttf-jetbrains-mono \
  nerd-fonts-jetbrains-mono \
  onlyoffice-bin \
  tt \
  htop \
  gnome-font-viewer \
  gitui \
  gnome-control-center

# install cpu microcodes
cpu_model_str=$(cat /proc/cpuinfo | grep 'model name' | uniq | tr '[:upper:]' '[:lower:]')
if [[ "$cpu_model_str" == *"amd"* ]]; then
  paru -S --skipreview --noconfirm --needed amd-ucode
elif [[ "$cpu_model_str" == *"intel"* ]]; then
  paru -S --skipreview --noconfirm --needed intel-ucode
fi

# install desired python modules
pip3 install dbus-python py3status requests

# update pnpm
sudo pnpm add -g pnpm
