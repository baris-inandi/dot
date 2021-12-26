source ~/dot/scripts/setup/installer.sh "$@"

# use the following params to configure your installation:
# default does not skip any step, to execute *some* steps, use the following params:

# noinstall     -> skips package installations
# symlink       -> creates config symlinks

# ════════════════════════════════════════════════════════════════════
# important initial setup
cd ~
wait
cp -n ~/dot/env.example.sh ~/dot/env.sh
source ~/dot/env.sh

pkg
lockscreen
firefox
symlink
system
finalize
