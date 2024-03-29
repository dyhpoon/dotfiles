# a pop up notification and sound alert (using the built-in sounds for macOS)

# Requires https://github.com/caarlos0/timer to be installed
# brew install terminal-notifier
# brew install caarlos0/tap/timer

# Mac setup for pomo
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias cb='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" | xargs git checkout'
alias weather="curl -4 wttr.in/central_hong_kong"
alias ls="exa"
alias ll="exa --long --header --git --icons"
alias tree="ll --tree --level=4 -a -I=.git --git-ignore"
alias zshrc="vim ~/.zshrc"
alias zshrcs="source ~/.zshrc"
alias gpr="GH_FORCE_TTY=100% gh pr list --limit 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout" 

function ghpr() {
    GH_FORCE_TTY=100% gh pr list --limit 1000 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

# switch different nvim config
# git clone --depth 1 https://github.com/LazyVim/starter ~/.config/LazyVim
function nvims() {
  items=("default" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
