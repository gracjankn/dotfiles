source "$HOME/.local/share/fsh/fast-syntax-highlighting.plugin.zsh" # Highlight syntax
unsetopt correct_all # No autocorrection
source $XDG_CONFIG_HOME/zsh/completion # Autocompletion
source $XDG_CONFIG_HOME/aliases # Aliases
eval "$(starship init zsh)" # Prompt
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Display manpages in bat
