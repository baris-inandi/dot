# installs essential packages

# install basic fonts
source ~/dot/scripts/setup/pkg/pkglist/font.sh

# install some other packages
source ~/dot/scripts/setup/pkg/pkglist/basic.sh

# install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install desired python modules
pip3 install dbus-python py3status
