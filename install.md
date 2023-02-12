- install vim-plug
  - sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

- create a folder in ~/.config/nvim
- put the config into the folder
- ln -s ~/dev/dotfiles/config/nvim nvim

- tmux source ~/.tmux.conf
- ln -s ~/dev/dotfiles/tmux.conf .tmux.conf

- iterm2:
- configure iTerm2 to effectively map ⌘+k to ctrl+l
    Keyboard shortcut: ⌘+k
    Action: Send Hex Code
    value: 0x0c


- brew
- powerlevel10k
- zoxide
- zsh-completion
- zsh-syntax-highlighting
- thefuck
- tmux
- ripgrep
- coreutils
- tealdeer
- fzf
- exa
- gh
- lazygit
- gnu-sed
