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

# uncomment if using rustup instead of rust
# configure rustup toolchain
# rustup install stable
# wait
# rustup default stable
# wait

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
  npm \
  pfetch \
  sudo \
  unrar \
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
  speedtest-cli \
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
  i3status \
  pm-utils \
  git-delta-git \
  rgb-tui-bin \
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
  ttf-fira-sans \
  otf-ibm-plex \
  ttf-fira-mono \
  ttf-fira-code \
  ttf-iosevka-nerd \
  ttf-droid \
  ttf-dejavu \
  inter-font \
  ttf-roboto \
  noto-fonts \
  adobe-source-code-pro-fonts \
  awesome-terminal-fonts \
  ttf-cascadia-code \
  ttf-font-awesome \
  ttf-hack \
  ttf-inconsolata \
  ttf-jetbrains-mono \
  nerd-fonts-jetbrains-mono \
  ttf-lato \
  ttf-liberation \
  cantarell-fonts \
  ttf-oldenglish5 \
  onlyoffice-bin \
  lxappearance-gtk3 \
  ttt \
  gnome-font-viewer \
  gnome-control-center \
  eog \
  evince \
  geary \
  gnome-music-git \
  prettier

# install cpu microcodes
cpu_model_str=$(cat /proc/cpuinfo | grep 'model name' | uniq | tr '[:upper:]' '[:lower:]')
if [[ "$cpu_model_str" == *"amd"* ]]; then
  sudo pacman -S amd-ucode
elif [[ "$cpu_model_str" == *"intel"* ]]; then
  sudo pacman -S intel-ucode
fi

# install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install desired python modules
pip3 install dbus-python py3status pipenv
