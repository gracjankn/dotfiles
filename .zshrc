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
alias cfz='nvim $HOME/.zshrc'
alias cfv='nvim $XDG_CONFIG_HOME/nvim/init.vim'
alias cfi='nvim $XDG_CONFIG_HOME/i3/config'
alias cfp='nvim $HOME/.profile'

# OS-specific aliases
case "$OSTYPE" in
darwin*)
alias ls='ls -AlhG'
alias resetLaunchpad='defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock'

# Brew aliases
alias bs="brew search"
alias bi="brew install"
alias bci='brew cask install'
alias bu='brew uninstall'
alias bcu='brew cask uninstall'
alias bz='brew cask zap'
alias bd="brew update && brew upgrade & brew cleanup & brew doctor"
alias bf='brew info'
alias bcf='brew cask info'
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
alias apti="sudo apt install"
alias aptse="sudo apt search"
alias aptup="sudo apt update && sudo apt upgrade"
alias aptup2="sudo apt update && sudo apt full-upgrade"
alias aptrm="sudo apt remove"
alias aptfix="sudo apt-get update –fix-missing; sudo dpkg –configure -a"
;;
esac
