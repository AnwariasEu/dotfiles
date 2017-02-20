# Anwarias custom config feel free to customize/copy/redistribute

# Configure SSH-Agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Add ~/bin to path
export PATH="~/bin:$PATH"

# Comand autocompletion
autoload -Uz compinit promptinit
compinit

# This will set the default prompt to the walters theme
promptinit
prompt anwarias


# Autocompletion arrow key support
zstyle ':completion:*' menu select

# History settings
#setopt autocd extendedglob
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
SAVEHIST=1000000
HISTFILE=~/.zsh_history

#Fix Delete Key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# Shell Setup
export EDITOR=vim

# Aliases
source ~/.my-aliases

# Functions

source ~/.my-functions


# Zsh Syntax Highlighting
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
