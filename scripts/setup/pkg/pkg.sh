# TODO: handle distro selections here (currently arch-only)

source ~/dot/scripts/setup/pkg/arch.sh

# distro-independent installation

# install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# install desired python modules
pip3 install dbus-python py3status pipenv
