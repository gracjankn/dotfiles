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

# Install 1Password
brew install 1password 1password-cli
open -a 1Password
echo "Log in to 1Password and enable the SSH agent in its settings. Press enter when you're done."
op signin
read

# Install and authenticate GitHub CLI
brew install gh
gh auth login -p ssh -h github.com -w

# Clone dotfiles repo
[ ! -d "$HOME/dotfiles" ] && gh repo clone gracjankn/dotfiles

# Make symbolic links
rm -Rdf "$HOME/.config"
rm -Rdf "$HOME/.local"
ln -sf "$HOME/dotfiles/.config" ~
ln -sf "$HOME/dotfiles/.local" ~
ln -sf "$HOME/dotfiles/.profile" ~
ln -sf "$HOME/dotfiles/.profile" ~/.zshenv

# Install syntax highlighting for ZSH
[ ! -d "$HOME/.local/share/fsh" ] && gh repo clone zdharma/fast-syntax-highlighting ~/.local/share/fsh

# Set computer name
sudo scutil --set ComputerName Deliverence;sudo scutil --set HostName Deliverence;sudo scutil --set LocalHostName Deliverence;sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string Deliverence

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
		
		# Remove default app icons
		defaults write com.apple.dock persistent-apps -array
		
		# Disable Dock icons bouncing
		defaults write com.apple.dock no-bouncing -bool false && \
		killall Dock
		
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
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string"$XDG_CONFIG_HOME/iterm";defaults write com.googlecode.iterm2.plistLoadPrefsFromCustomFolder -bool true
	
	# Safari
		
		# Google Safe Browsing: off
		defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool false
		
		# Quick Website Search: off
		defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false
		
	# Disable creation of .DS_Store files on external and network volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool truedefaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
	
	# Don't offer new disks for Time Machine backup
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
	
	# Allow Help Menu to go behind other windows
	defaults write com.apple.helpviewer DevMode -bool true
	
	# Always show proxy icon (restores behavior from before macOS Big Sur)
	defaults write -g NSToolbarTitleViewRolloverDelay -float 0
	
# Print warning if csrutil is not enabled
[ "$(csrutil status)" != "System Integrity Protection status: enabled." ] && echo 'System Integrity Protection not enabled'
