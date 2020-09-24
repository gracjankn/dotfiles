#!/bin/sh

defaults write com.apple.screencapture disable-sfhadow -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.Dock autohide-delay -float 0;defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

[ ! -d "$HOME/dotfiles" ] && git clone git@github.com:gracjankn/dotfiles.git
[ ! -d "$HOME/.slimzsh" ] && git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh

ln -sf "$HOME/dotfiles/.config" ~
ln -sf "$HOME/dotfiles/.local" ~
ln -sf "$HOME/dotfiles/.zshrc" ~
ln -sf "$HOME/dotfiles/.profile" ~
ln -sf "$HOME/.profile" ~/.zprofile


which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
which nvim >/dev/null 2>&1 || brew install neovim
which lsd >/dev/null 2>&1 || brew install lsd
which speedtest-cli >/dev/null 2>&1 || brew install speedtest-cli

touch "$HOME/.hushlogin"
