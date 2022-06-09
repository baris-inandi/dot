# this file includes:
# pkg() lockscreen() firefox() symlink() system() finalize()

# ════════════════════════════════════════════════════════════════════
# install helpers, basic packages, programming languages, and fonts.
pkg() {
  printf "\nDOT: running pkg()...\n\n"
  source ~/dot/scripts/setup/pkg.arch.sh
  wait
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
  sudo ln -f -s ~/dot/config/pacman.conf /etc/pacman.conf
  timectl set-timezone Europe/Istanbul
  systemctl enable systemd-timesyncd
  systemctl enable NetworkManager
  hostnamectl set-hostname arch
  echo "dark" >~/.config/dot-theme
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
