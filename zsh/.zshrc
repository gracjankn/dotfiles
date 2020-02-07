# Source config files and directories
source "$HOME/.slimzsh/slim.zsh"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

unsetopt correct_all

# Basic aliases
alias ls='ls -Alh --color=always'
alias tree='tree -afC'
alias rm='rm -rdf'
alias v='nvim'
alias g='git'
alias c='clear'

# Edit configs
alias cfz='nvim $HOME/dotfiles/zsh/.zshrc'
alias cfv='nvim $HOME/dotfiles/neovim/.config/nvim/init.vim'
alias cfi='nvim $HOME/dotfiles/i3/.config/i3/config'
alias cft='nvim $HOME/dotfiles/tmux/.tmux.conf'

# OS-specific aliases
case "$OSTYPE" in
darwin*)
# macOS

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

alias p='sudo pacman'
alias y='yaourt'
;;
esac
