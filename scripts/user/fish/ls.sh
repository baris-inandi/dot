call_exa() {
  # TODO: add a --detailed option for other exa options
  exa --group-directories-first --icons -laFh --git --no-user --no-time
}

call_exa || ls
