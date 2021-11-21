cd ~
wait

# init pacman
sudo pacman -Sy
wait
sudo pacman -S --needed base-devel
wait

# install paru
source ~/dot/scripts/pkg/paru.sh
wait

# install initial packages
source ~/dot/scripts/pkg/pkg.sh
wait

# systemd lockscreen service
source ~/dot/scripts/other/lock.sh
wait

# create config symlinks
source ~/dot/scripts/other/symlinks.sh
wait

# copy default wallpaper
cp -f ~/dot/wallpaper.png ~/Pictures/wallpaper.png
wait

# fish as deafult shell
chsh --shell /usr/bin/fish
wait

# update everything
paru
wait