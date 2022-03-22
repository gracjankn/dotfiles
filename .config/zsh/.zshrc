eval "$(starship init zsh)" # Prompt
source "$HOME/.local/share/fsh/fast-syntax-highlighting.plugin.zsh" # Highlight syntax
source $XDG_CONFIG_HOME/zsh/completion # Autocompletion
source $XDG_CONFIG_HOME/aliases # Aliases
unsetopt correct_all # No autocorrection
 export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
