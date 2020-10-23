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
alias vim='nvim'
alias g='git'
alias c='clear'

# ls aliases
alias ls='lsd -Al'
alias la='lsd -A' 
alias ll='lsd -A' 
alias l.='lsd -a | egrep "^\."'

# navigation
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'

# Config aliases
alias cfz='nvim $XDG_CONFIG_HOME/zsh/.zshrc'
alias cfv='nvim $XDG_CONFIG_HOME/nvim/init.vim'
alias cfi='nvim $XDG_CONFIG_HOME/i3/config'
alias cfe='nvim $HOME/.zshenv'
alias sc='source $XDG_CONFIG_HOME/zsh/.zshrc'

# OS-specific
case "$OSTYPE" in
darwin*)
alias resetLaunchpad='defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock'
alias flushDNS='sudo killall -HUP mDNSResponder'
alias copySSH='pbcopy < ~/.ssh/id_rsa.pub'
alias update='sudo softwareupdate -ia —verbose ; brew bundle --file $HOME/dotfiles/Brewfile ; brew cleanup ; brew doctor'

export PATH="/usr/local/sbin:$PATH"

# Brew aliases
alias bs="brew search"
alias bi="brew install"
alias bu='brew rm'
alias bz='brew cask zap'
alias bd="brew update && brew upgrade & brew cleanup & brew doctor"
alias bf='brew info'
alias bcf='brew cask info'
alias bh='brew home'
alias bl='brew list'
alias bcl='brew list --cask'
alias br='brew reinstall'
;;
linux*)

# Apt aliases
alias apti="sudo apt install"
alias aptse="sudo apt search"
alias aptup="sudo apt update && sudo apt upgrade"
alias aptup2="sudo apt update && sudo apt full-upgrade"
alias aptrm="sudo apt remove"
alias aptfix="sudo apt-get update –fix-missing; sudo dpkg –configure -a"
;;
esac
