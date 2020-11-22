#!/bin/bash

# Clone git repos
	[ ! -d "$HOME/dotfiles" ] && git clone git@github.com:gracjankn/dotfiles.git
	[ ! -d "$HOME/.local/share/fsh" ] && git clone https://github.com/zdharma/fast-syntax-highlighting ~/.local/share/fsh

# Make symbolic links
	ln -sf "$HOME/dotfiles/.config" ~
	ln -sf "$HOME/dotfiles/.local" ~
	ln -sf "$HOME/dotfiles/.zshenv" ~

# OS specific commands

case "$OSTYPE" in
darwin*)

	# Set computer name
	sudo scutil --set ComputerName MacBook;sudo scutil --set HostName MacBook;sudo scutil --set LocalHostName MacBook;sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string MacBook

	# Set Mac defaults
		# Disable shadow for screenshots
		defaults write com.apple.screencapture disable-sfhadow -bool true
		# Automatically expand print dialogs
		defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
		# Dock: enable autohide, disable delay & animation, disable recent apps, set left orientation, enable Minimize to Application, 
		defaults write com.apple.dock autohide -bool true;defaults write com.apple.Dock autohide-delay -float 0;defaults write com.apple.dock autohide-time-modifier -int 0;defaults write com.apple.dock show-recents -bool false;defaults write com.apple.dock minimize-to-application -bool true;defaults write com.apple.dock orientation "left";killall Dock
		# Set interval for checking for updates to one day
		defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
		# Enable Subpixel Anti-Aliasing (Font Smoothing)
		defaults write -g CGFontRenderingFontSmoothingDisabled -bool false
		# Use plain text mode as default in TextEdit
		defaults write com.apple.TextEdit RichText -int 0
		# Quit printer app after print jobs complete
		defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
		# iTerm: specify the preferences directory
		defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$XDG_CONFIG_HOME/iterm";defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
		# Safari: disable Google Safe Browsing, disable Quick Website Search
		defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool false;defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false
		# Disable creation of .DS_Store files on external and network volumes
		defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

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
