# Path to the Oh-My-Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set the shell theme
ZSH_THEME="robbyrussell"

# Choose the shell plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load the user configuration
source ~/.zsh_profile

# Use pywal colors for every instance of the shell
(cat ~/.cache/wal/sequences &)
