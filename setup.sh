#!/bin/bash

# Enable FileVault
[ "$(sudo fdesetup status)" != "FileVault is On." ] && sudo fdesetup enable

# Configure firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp on
sudo pkill -HUP socketfilterfw

# Install Homebrew
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Homebrew packages listed in the Brewfile
brew bundle --file=$HOME/dotfiles/Brewfile
rm $HOME/dotfiles/Brewfile.lock.json

# Install 1Password
open -a 1Password
echo "Log in to 1Password and enable the SSH agent in its settings. Press enter when you're done."
read

# Clone dotfiles repo
[ ! -d "$HOME/dotfiles" ] && git clone git@github.com:gracjankn/dotfiles.git

# Make symbolic links
rm -Rdf "$HOME/.config"
rm -Rdf "$HOME/.local"
ln -sf "$HOME/dotfiles/.config" ~
ln -sf "$HOME/dotfiles/.local" ~
ln -sf "$HOME/dotfiles/.profile" ~
ln -sf "$HOME/dotfiles/.profile" ~/.zshenv

# Install syntax highlighting for ZSH
[ ! -d "$HOME/.local/share/fsh" ] && git clone git@github.com:zdharma/fast-syntax-highlighting.git ~/.local/share/fsh

# Set computer name
sudo scutil --set ComputerName Rubicon;sudo scutil --set HostName Rubicon;sudo scutil --set LocalHostName Rubicon;sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string Rubicon

# Get rid of welcome message in terminal
touch $HOME/.hushlogin

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

		# Quicker key presses
		defaults write -g InitialKeyRepeat -int 10 ; defaults write -g KeyRepeat -int 1

		# Faster trackpad speed
		defaults write .GlobalPreferences com.apple.trackpad.scaling -float 3

		# Disable blinking cursor
		defaults write -g NSTextInsertionPointBlinkPeriodOn -float 99999999;defaults write -g NSTextInsertionPointBlinkPeriodOff -float 99999999

	# Dock
		
		# Autohide animation time: 0
		defaults write com.apple.dock autohide-time-modifier -float 0
		
		# Autohide delay: 0
		defaults write com.apple.Dock autohide-delay -float 0
		
		# Restart Dock
		killall Dock

	# Set interval for checking for updates to one day
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
	
	# Use plain text mode as default in TextEdit
	defaults write com.apple.TextEdit RichText -int 0
	
	# Quit printer app after print jobs complete
	defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
	
	# iTerm: specify the preferences directory
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string"$XDG_CONFIG_HOME/iterm";defaults write com.googlecode.iterm2.plistLoadPrefsFromCustomFolder -bool true
	
	# Safari
		
		# Google Safe Browsing: off
		defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool false
		
	# Disable creation of .DS_Store files on external and network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
	
	# Don't offer new disks for Time Machine backup
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
	
	# Allow Help Menu to go behind other windows
	defaults write com.apple.helpviewer DevMode -bool true
	
	# Always show proxy icon (restores behavior from before macOS Big Sur)
	defaults write -g NSToolbarTitleViewRolloverDelay -float 0
	
# Print warning if csrutil is not enabled
[ "$(csrutil status)" != "System Integrity Protection status: enabled." ] && echo 'System Integrity Protection not enabled'