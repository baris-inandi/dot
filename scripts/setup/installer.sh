# this file includes:
# pkg() theme() lockscreen() firefox() symlink() system() finalize()

# ════════════════════════════════════════════════════════════════════
# install helpers, basic packages, programming languages, and fonts.
pkg() {
  printf "\nDOT: running pkg()...\n\n"
  source ~/dot/scripts/setup/pkg.arch.sh
  wait
}

# ════════════════════════════════════════════════════════════════════
# install themes
theme() {
  printf "\nDOT: running theme()...\n\n"
  # Graphite GTK theme
  rm -rf ~/.cache/dot-insaller-theme
  mkdir ~/.cache/dot-insaller-theme
  cd ~/.cache/dot-insaller-theme
  git clone --depth 1 https://github.com/vinceliuice/Graphite-gtk-theme.git graphite
  cd graphite
  bash install.sh --tweaks rimless normal darker -s compact
  rm -rf ~/.cache/dot-insaller-theme
  cd ~
  # Papirus folders
  paru -S --needed --skipreview papirus-folders
  papirus-folders -C black
}

# ════════════════════════════════════════════════════════════════════
# systemd lockscreen service
lockscreen() {
  printf "\nDOT: running lockscreen()...\n\n"
  cp betterlockscreen@.service /usr/lib/systemd/system/
  wait
  systemctl enable betterlockscreen@$USER
  wait
}

# ════════════════════════════════════════════════════════════════════
# firefox setup
firefox() {
  printf "\nDOT: running firefox()...\n\n"
  if [ ! -f ~/.mozilla/firefox/.dotguard ]; then
    rm -rf ~/.mozilla/*
    wait
    cp -R ~/dot/config/firefox ~/.mozilla/firefox/
    wait
    touch ~/.mozilla/firefox/.dotguard
  fi
}

# ════════════════════════════════════════════════════════════════════
# create config symlinks
symlink() {
  printf "\nDOT: running symlink()...\n\n"
  source ~/dot/scripts/setup/symlink.sh
  wait
}

# ════════════════════════════════════════════════════════════════════
# change system settings
system() {
  printf "\nDOT: running system()...\n\n"
  sudo ln -f -s ~/dot/config/hosts /etc/hosts
  wait
  sudo ln -f -s ~/dot/config/vconsole.conf /etc/vconsole.conf
  wait
  sudo ln -f -s ~/dot/config/pam-login /etc/pam.d/login
  wait
  timectl set-timezone Europe/Istanbul
  systemctl enable systemd-timesyncd
  systemctl enable NetworkManager
  hostnamectl set-hostname arch
  touch ~/.config/dot-theme
  bash ~/dot/scripts/user/toggle-theme.sh
  source ~/dot/scripts/setup/silence_boot.sh
}

# ════════════════════════════════════════════════════════════════════
# restart i3 to load all configs
finalize() {
  printf "\nDOT: running finalize()...\n\n"
  # pacman cleanup
  fish -c "rparu"
  i3-msg restart
  # cool ending
  neofetch
  # fish as deafult shell
  chsh --shell /usr/bin/fish
  wait
}
