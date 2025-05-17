bindkey "jk" vi-cmd-mode
bindkey -M vicmd '/' history-incremental-search-backward
alias tm='tmux attach || tmux new'

# bolt fonts in terminal
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color
export EDITOR='vim'
export VISUAL='vim'
export LANG='en_US.UTF-8'

case "$OSTYPE" in
  linux*)
    export LD_LIBRARY_PATH=$HOME/.cuda/lib64:$LD_LIBRARY_PATH
    export PATH="$HOME/.cuda/bin:$PATH"
    ;;
  darwin*)  
    export BREW=$HOME/.homebrew
    export PATH='/Applications/Docker.app/Contents/Resources/bin:'$PATH
    ;;
esac

SOURCES=($BREW $HOME/.local /usr/local /usr /)

for i in ${SOURCES[*]}; do
    export PATH=$PATH:$i/bin
    # export PATH=$PATH:$i/sbin
    # export CPATH=$CPATH:$i/include
    # export LIBRARY_PATH=$LIBRARY_PATH:$i/lib
done

# Enable color support
autoload -U colors && colors

# Basic ZSH completion settings
autoload -Uz compinit
compinit

# Highlight the selection
zstyle ':completion:*' menu select

# Color completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Function to get the current git branch
git_branch() {
  local branch=$(git branch --no-color 2>/dev/null | grep '^*' | colrm 1 2)
  if [ -n "$branch" ]; then
    echo " %F{magenta}[$branch]%f"
  fi
}

# Enable prompt command substitution
setopt PROMPT_SUBST

# Prompt with hostname, current directory, git branch and exit status indicator
PROMPT='%F{cyan}%m%f:%F{green}%~%f$(git_branch) %(?:%F{yellow}❯:%F{red}❯)%f '