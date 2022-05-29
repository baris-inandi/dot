# packman
sudo zypper ar -f -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
sudo zypper dup --from packman --allow-vendor-change

# google chrome
zypper ar -f http://dl.google.com/linux/chrome/rpm/stable/x86_64 google-chrome
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

zypper ar -f http://download.opensuse.org/update/tumbleweed/ update                                 # update
zypper ar -f http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed games              # games
zypper ar -f http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Tumbleweed fonts        # fonts
zypper ar -f https://download.nvidia.com/opensuse/tumbleweed NVIDIA                                 # nvidia drivers
zypper ar -f https://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/ mozilla        # mozilla
zypper ar -f https://download.opensuse.org/repositories/Emulators:/Wine/openSUSE_Tumbleweed/ wine   # wine
zypper ar -f https://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_Factory+GNOME_Factory/ # gnome apps

https://download.opensuse.org/repositories/Java:/
