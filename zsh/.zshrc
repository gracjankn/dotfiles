# Source config files and directories
source "$HOME/.slimzsh/slim.zsh"

unsetopt correct_all

# Basic aliases
alias ls='ls -Alh'
alias rm='rm -rdf'
alias v='nvim'
alias g='git'
alias c='clear'

# Edit configs
alias cfz='nvim $HOME/dotfiles/zsh/.zshrc'
alias cfv='nvim $HOME/dotfiles/neovim/.config/nvim/init.vim'
alias cfi='nvim $HOME/dotfiles/i3/.config/i3/config'
alias cft='nvim $HOME/dotfiles/tmux/.tmux.conf'

# Brew aliases
if [[ "$OSTYPE" = darwin* ]]; then

alias bs='brew search'
alias bi='brew install'
alias bci='brew cask install'
alias bf='brew info'
alias bcf='brew cask info'
alias bu='brew uninstall'
alias bcu='brew cask uninstall'
alias bz='brew cask zap'
alias bh='brew home'
alias bch='brew cask home'
alias bl='brew list'
alias bcl='brew cask list'
alias bc='brew update;brew upgrade;brew cask upgrade;brew cleanup;brew doctor'

fi
