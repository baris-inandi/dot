sudo apt update -y
sudo apt upgrade -y
sudo apt install -y lsd gh git micro zsh curl wget trash-cli fastfetch

if apt-cache show starship >/dev/null 2>&1; then
    sudo apt install -y starship
else
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi
