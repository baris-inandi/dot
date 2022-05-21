# critial startup scripts, use startup.sh for device-specific actions.

# create files/dirs expected by dot
mkdir -p ~/Pictures/Screenshots
touch ~/dot/startup.sh

# auto pull dot if there are no local changes.
bash ~/dot/scripts/sync/sync.sh

# run custom startup script
bash ~/dot/startup.sh

# re-run symlink.sh
bash ~/dot/scripts/setup/symlink.sh
