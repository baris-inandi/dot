# critial startup scripts, use startup.sh for device-specific actions.

# create files/dirs
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Downloads
touch ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh

# run custom startup script
bash ~/dot/startup.sh
