#!/bin/bash

# Clone git repos
	[ ! -d "$HOME/dotfiles" ] && git clone git@github.com:gracjankn/dotfiles.git
	[ ! -d "$HOME/.slimzsh" ] && git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh

# Make symbolic links
	ln -sf "$HOME/dotfiles/.config" ~
	ln -sf "$HOME/dotfiles/.local" ~
	ln -sf "$HOME/dotfiles/.zshrc" ~
	ln -sf "$HOME/dotfiles/.profile" ~
	ln -sf "$HOME/.profile" ~/.zprofile


# Disable login message
touch "$HOME/.hushlogin"

# OS specific commands

case "$OSTYPE" in
darwin*)

	# Set Mac defaults
		defaults write com.apple.screencapture disable-sfhadow -bool true
		defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
		defaults write com.apple.Dock autohide-delay -float 0;defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
		defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

	# Install Mac packages
	
		packages=(lsd speedtest-cli shellcheck exiftool )	
		
		which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		
		for x in "${packages[@]}"; do
		
			which "$x" >/dev/null 2>&1 || brew install "$x"
		
		done
		
		which nvim >/dev/null 2>&1 || brew install neovim

;;
linux*)

if [ -f /etc/debian_version ]; then

	packages=(shellcheck)
	
	for x in "${packages[@]}"; do
	
		which "$x" >/dev/null 2>&1 || sudo apt install "$x"
	
		which nvim >/dev/null 2>&1 || sudo apt install neovim
	
	done

fi

;;
esac