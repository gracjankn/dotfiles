eval "$(starship init zsh)" # Prompt
source "$HOME/.local/share/fsh/F-Sy-H.plugin.zsh" # Highlight syntax
source $XDG_CONFIG_HOME/zsh/completion # Autocompletion
source $XDG_CONFIG_HOME/aliases # Aliases
unsetopt correct_all # No autocorrection
 export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=$PATH:/usr/local/sbin

# Make GPG work with my YubiKey
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
