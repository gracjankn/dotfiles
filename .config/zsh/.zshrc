source "$HOME/.local/share/fsh/F-Sy-H.plugin.zsh" # Highlight syntax
source $XDG_CONFIG_HOME/zsh/completion # Autocompletion
source $XDG_CONFIG_HOME/aliases # Aliases
unsetopt correct_all # No autocorrection
eval "$(/opt/homebrew/bin/brew shellenv)"
 export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/sbin
# Use Homebrew's version of OpenSSH
export PATH=$(brew --prefix openssh)/bin:$PATH
eval "$(starship init zsh)"
