# Silences the boot process when using systemd-boot

# systemd-boot config to start booting in 0 seconds
if ! [[ $(cat /boot/loader/loader.conf | grep "timeout 0") ]]; then
  sudo bash -c "echo timeout\ 0 >/boot/loader/loader.conf"
  echo "Set boot timeout to 0"
else
  echo "Boot timeout already set to 0, skipping"
fi

bat /boot/loader/loader.conf

# append hooks to mkinitcpio.conf
prev_hooks=$(cat /etc/mkinitcpio.conf | grep HOOKS)
target_hooks="HOOKS=(base systemd autodetect keyboard sd-vconsole block filesystems fsck)"
mkinitcpio_old=$(cat /etc/mkinitcpio.conf)
if [[ $prev_hooks ]]; then
  if [[ $target_hooks != $prev_hooks ]]; then
  	echo $target_hooks
  	echo $prev_hooks
    sudo sed -i "s/$prev_hooks/$target_hooks/" /etc/mkinitcpio.conf
  else
    echo "Hooks already configured, skipping"
  fi
else
  sudo bash -c "echo \"HOOKS=(base systemd autodetect keyboard sd-vconsole block filesystems fsck)\" >>/etc/mkinitcpio.conf"
fi
mkinitcpio_new=$(cat /etc/mkinitcpio.conf)

bat /etc/mkinitcpio.conf

# generate new linux img
if ! [[ $mkinitcpio_old == $mkinitcpio_new ]]; then
  echo "Generating new linux img"
  sudo mkinitcpio -p linux
else
  echo "No changes to mkinitcpio.conf, skipping img build"
fi

# update loaderfile
for f in "/boot/loader/entries/*"; do
  current_options=$(cat $f | grep -h PARTUUID= | head -1)
  silent_options="quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_level=3"
  has_silent_options=$(cat $f | grep -h "$silent_options")
  if ! [[ $has_silent_options ]]; then
    new_options="$current_options $silent_options"
    sudo sed -i "s/$current_options/$new_options/" $f
    echo "Added silent options to boot entry"
  else
    echo "Boot entry already configured, skipping"
  fi
  bat $f
done
