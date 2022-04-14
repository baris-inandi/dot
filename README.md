# dot

.dotfiles!

An overengineered dotfile repo full with useful scripts, themes, an installer and more!

## What does these shell files do?

dot.sh
╰─> Runs after i3, calls sync.sh for syncing dot along with startup.sh which includes device-specific startup scripts that is (optionally) located at ~/dot/startup.sh

env.sh
╰─> Lets the user set environment variables such as display, resolution and refresh rate

install.sh
╰─> Installs essential packages, sets up lockscreen, config symlinks, system settings and utilizes fish shell to include custom scripts defined in ~/dot/scripts/user
