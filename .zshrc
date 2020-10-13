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
alias cfz='nvim $HOME/.zshrc'
alias cfv='nvim $XDG_CONFIG_HOME/nvim/init.vim'
alias cfi='nvim $XDG_CONFIG_HOME/i3/config'
alias cfp='nvim $HOME/.profile'

# OS-specific aliases
case "$OSTYPE" in
darwin*)
alias resetLaunchpad='defaults write com.apple.dock ResetLaunchPad -bool true;killall Dock'
alias flushDNS='sudo killall -HUP mDNSResponder'
alias copySSH='pbcopy < ~/.ssh/id_rsa.pub'
alias update='sudo softwareupdate -ia —verbose ; brew bundle --file $HOME/dotfiles/Brewfile ; brew cleanup ; brew doctor'

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
alias bl='brew list'
alias bcl='brew list --cask'
alias br='brew reinstall'
alias bcr='brew reinstall --cask'
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

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
