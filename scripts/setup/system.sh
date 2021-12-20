# hosts
sudo cp -f ~/dot/config/system/hosts /etc/hosts
wait

# configure keyboard layout
sudo cp -f ~/dot/config/system/vconsole.conf /etc/vconsole.conf
wait

# post install configs
timectl set-timezone Europe/Istanbul
systemctl enable systemd-timesyncd
hostnamectl set-hostname baris-arch
