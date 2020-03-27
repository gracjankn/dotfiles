# Source config files and directories
source "$HOME/.slimzsh/slim.zsh"

# Disable autocorrection
unsetopt correct_all

# Show pfetch on session start
pfetch

# Basic aliases
alias tree='tree -afC'
alias rm='rm -rdf'
alias v='nvim'
alias g='git'
alias c='clear'

# Edit configs
alias cfz='nvim $HOME/.zshrc'
alias cfv='nvim $HOME/.config/nvim/init.vim'
alias cfi='nvim $HOME/.config/i3/config'
alias cft='nvim $HOME/.tmux.conf'

# OS-specific aliases
case "$OSTYPE" in
darwin*)
# macOS

# Basic aliases
alias ls='ls -AlhG'

# Brew aliases

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
alias br='brew reinstall'
alias bcr='brew cask reinstall'

;;
linux*)
# Linux

alias ls='ls -Alh --color=always'

alias p='sudo pacman'
alias y='yay'
;;
esac