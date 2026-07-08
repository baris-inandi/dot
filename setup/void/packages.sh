# make sure everything is up to date
sudo xbps-install -Syu

# add the nonfree repo and fetch it
sudo xbps-install -y void-repo-nonfree
sudo xbps-install -Sy

# basic needs
sudo xbps-install -y base-system binutils curl git grub-x86_64-efi mesa-dri micro

# nvidia drivers
sudo xbps-install -y nvidia nvidia-dkms nvidia-firmware nvidia-gtklibs nvidia-libs

# graphical stuff
sudo xbps-install -y nerd-fonts-ttf xorg alacritty awesome firefox

# quality-of-life stuff
sudo xbps-install -y btop github-cli delta fastfetch bat lsd skim trash-cli starship
