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
		# Disable shadow for screenshots
		defaults write com.apple.screencapture disable-sfhadow -bool true
		# Automatically expand print dialogs
		defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
		# Dock: enable autohide, disable delay & animation, disable recent apps
		defaults write com.apple.dock autohide -bool true;defaults write com.apple.Dock autohide-delay -float 0;defaults write com.apple.dock autohide-time-modifier -int 0;defaults write com.apple.dock show-recents -bool false;killall Dock
		# Set interval for checking for updates to one day
		defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
		# Enable Subpixel Anti-Aliasing (Font Smoothing)
		defaults write -g CGFontRenderingFontSmoothingDisabled -bool false
		# Use plain text mode as default in TextEdit
		defaults write com.apple.TextEdit RichText -int 0
		# Quit printer app after print jobs complete
		defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

	# Install Mac packages
		
		command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		
		brew bundle --file "$HOME/dotfiles/Brewfile"

;;
linux*)

if command -v apt >/dev/null 2>&1; then

	packages=(shellcheck)
	
	for x in "${packages[@]}"; do
	
		command -v "$x" >/dev/null 2>&1 || sudo apt install "$x"
	
		command -v nvim >/dev/null 2>&1 || sudo apt install neovim
	
	done

fi

;;
esac