# packman
sudo zypper ar -f -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ Packman

zypper ar -f http://dl.google.com/linux/chrome/rpm/stable/x86_64/ Google-Chrome                           # google chrome
zypper ar -f http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/ Games                   # games
zypper ar -f http://download.opensuse.org/repositories/M17N:/fonts/openSUSE_Tumbleweed/ Fonts             # fonts
zypper ar -f https://download.nvidia.com/opensuse/tumbleweed/ NVIDIA                                      # nvidia drivers
zypper ar -f https://download.opensuse.org/repositories/mozilla/openSUSE_Tumbleweed/ Mozilla              # mozilla
zypper ar -f https://download.opensuse.org/repositories/Emulators:/Wine/openSUSE_Tumbleweed/ Wine         # wine
zypper ar -f https://download.opensuse.org/repositories/GNOME:/Apps/openSUSE_Factory+GNOME_Factory/ Gnome # gnome apps
zypper ar -f https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed/ Tools        # tools

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub/
sudo zypper dup --from Packman --allow-vendor-change
zypper refresh
