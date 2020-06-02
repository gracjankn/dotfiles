# Make shell more pretty
source "$HOME/.slimzsh/slim.zsh"

# Disable autocorrection
unsetopt correct_all

# Show system info and logo
pfetch

# Basic aliases
alias tree='tree -afC'
alias rm='rm -rdf'
alias v='nvim'
alias g='git'
alias c='clear'

# Config aliases
alias cfz='nvim $XDG_CONFIG_HOME/zsh/.zshrc'
alias cfv='nvim $XDG_CONFIG_HOME/nvim/init.vim'
alias cfi='nvim $XDG_CONFIG_HOME/i3/config'
alias cfp='nvim $HOME/.profile'

# OS-specific aliases
case "$OSTYPE" in
darwin*)
alias ls='ls -AlhG'

# Brew aliases
alias bri="brew install"
alias brse="brew search"
alias brup="brew update && brew upgrade"
alias brrm="brew uninstall"
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
alias br='brew reinstall'
alias bcr='brew cask reinstall'
;;
linux*)
alias ls='ls -Alh --color=always'

# Apt aliases
alias apti="apt install"
alias aptse="apt search"
alias aptup="apt update && apt upgrade"
alias aptup2="apt update && apt full-upgrade"
alias aptrm="apt remove"
alias aptfix="apt-get update –fix-missing; dpkg –configure -a"
;;
esac
