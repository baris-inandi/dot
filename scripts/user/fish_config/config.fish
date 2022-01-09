# aliases
alias vi="~/.local/bin/lvim"
alias c="clear"

# web shortcuts
function classroom
    firefox "https://classroom.google.com/u/1/h"
    exit
end

function github -a repo
    firefox https://github.com/baris-inandi/$repo
end

function monk
    firefox --new-window https://monkeytype.com
    exit
end

set -gx EDITOR micro

# if status is-interactive
#   Commands to run in interactive sessions can go here
# end
