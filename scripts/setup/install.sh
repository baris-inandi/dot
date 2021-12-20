cd ~
wait

# init pacman
sudo pacman -Syu
wait
sudo pacman -S --needed base-devel
wait

# install paru
source ~/dot/scripts/setup/pkg/paru.sh
wait

# install initial packages
source ~/dot/scripts/setup/pkg/pkg.sh
wait

# systemd lockscreen service
source ~/dot/scripts/setup/lock.sh
wait

# firefox setup
source ~/dot/scripts/setup/firefox.sh

# create config symlinks
source ~/dot/scripts/setup/symlink.sh
wait

# install cpu microcode
source ~/dot/scripts/setup/pkg/microcode.sh

# fish as deafult shell
chsh --shell /usr/bin/fish
wait

# update everything
paru
wait

# cool ending
neofetch
