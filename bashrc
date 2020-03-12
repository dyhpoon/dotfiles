# System default
# --------------------------------------------------------------------

export PLATFORM=$(uname -s)

# Options
# --------------------------------------------------------------------

### Append to the history file
shopt -s histappend
shopt -s histreedit
shopt -s histverify

### history
export HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -a;history -c; history -r; $PROMPT_COMMAND"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
# --------------------------------------------------------------------
alias k='kubectl'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Rust
[ -e ~/.cargo/bin ] && export PATH=$PATH:~/.cargo/bin

alias ls='exa'
alias cat='bat'
alias less='bat'
alias grep='ripgrep'
