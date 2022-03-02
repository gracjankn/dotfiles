export XDG_CONFIG_HOME=$HOME/.config # Set config directory
export XDG_CACHE_HOME=$HOME/.cache # Set cache directory
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc # Make NPM respect XDG Base Directory specification
export LESSHISTFILE="-" # Disable Less history file
export STARSHIP_CACHE= # Disable Starship prompt cache

# Make ZSH respect XDG Base Directory specification (kind of)
export ZDOTDIR=$HOME/.config/zsh 
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# Add my private scripts folder to $PATH
export PATH=$HOME/.local/bin:$PATH

# Add /usr/loca/sbin to $PATH to resolve Homebrew warning
export PATH="/usr/local/sbin:$PATH"

# Set default apps
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Display manpages in bat

export HOMEBREW_NO_ANALYTICS=1 # Opt-out of Brew's data collection via Google Analytics
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30 # Set the number of days Brew keeps caches
export HOMEBREW_CURL_RETRIES=1 # Only retry once if running Curl fails
export HOMEBREW_FORCE_BREWED_CURL=1 # Always use brew of version Curl instead of one provided by the system
export HOMEBREW_FORCE_BREWED_GIT=1 # Always use brew of version Git instead of one provided by the system
export HOMEBREW_FORCE_VENDOR_RUBY=1 # Always use brew of version Ruby instead of one provided by the system
export HOMEBREW_NO_AUTO_UPDATE=1 # Don't automatically run brew update before other brew commands
export HOMEBREW_NO_COMPAT=1 # Disable all legacy code
export HOMEBREW_NO_INSTALL_CLEANUP=1 # Don't automatically run brew clean before other brew commands
export HOMEBREW_UPDATE_REPORT_ONLY_INSTALLED=1 # Don't show updates to not-installed packages when running brew upgrade

# Make ADB respect XDG Base Directory specification
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
