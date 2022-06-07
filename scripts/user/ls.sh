call_exa() {
  exa --group-directories-first -laFh --git --no-user --no-time --octal-permissions --no-permissions $@
}

call_exa $@ || ls
