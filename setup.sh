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
		# Finder
		
			# Show extensions: on
			defaults write NSGlobalDomain AppleShowAllExtensions -bool true
			
			# Changing file extension warning: off
			defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
			
			# Restart Finder
			killall Finder
		
		# Disable shadow for screenshots
		defaults write com.apple.screencapture disable-sfhadow -bool true
		
		# Automatically expand print dialogs
		defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
		
		# Dock: enable autohide, disable delay & animation, disable recent apps, set left orientation, enable Minimize to Application
			
			# Position: left
			defaults write com.apple.dock orientation -string left
			
			# Icon size: 48
			defaults write com.apple.dock tilesize -int 48
			
			# Autohide: on
			defaults write com.apple.dock autohide -bool true
			
			# Autohide animation time: 0
			defaults write com.apple.dock autohide-time-modifier -float 0
			
			# Autohide delay: 0
			
			defaults write com.apple.Dock autohide-delay -float 0
			
			# Show recents: off
			defaults write com.apple.dock show-recents -bool false
			
			# Minimize windows into application icon: on
			defaults write com.apple.dock minimize-to-application -bool true
			
			# Restart Dock
			killall Dock
						

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
		
		# Safari
			
			# Google Safe Browsing: off
			defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool false
			
			# Quick Website Search: off
			defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false
			
		# Disable creation of .DS_Store files on external and network volumes
		defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
		
		# Don't offer new disks for Time Machine backup
		defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
		
		# Allow Help Menu to go behind other windows
		defaults write com.apple.helpviewer DevMode -bool true

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