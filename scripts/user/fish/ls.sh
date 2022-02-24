call_exa() {
  # TODO: add a --detailed option for other exa options
  exa --group-directories-first --icons -laFh --git --no-user --no-time --octal-permissions --no-permissions
}

call_exa || ls
