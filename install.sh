install() {
  source ~/dot/scripts/setup/installer.sh "$@"

  cd ~
  cp -n ~/dot/env.example.sh ~/dot/env.sh
  source ~/dot/env.sh
  wait

  pkg
  theme
  lockscreen
  symlink
  system
  finalize
}

if : >/dev/tcp/8.8.8.8/53; then
  install
else
  echo 'Connect to the Internet to install dot.'
fi
