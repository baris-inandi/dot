source ~/dot/scripts/setup/installer.sh "$@"

cd ~
cp -n ~/dot/env.example.sh ~/dot/env.sh
source ~/dot/env.sh
wait

pkg
lockscreen
# firefox
symlink
system
finalize
