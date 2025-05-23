#!/usr/bin/env bash
#
# Dotfiles Installation Script
# This script installs and configures the dotfiles setup.
# It handles backing up existing configurations, setting up symlinks,
# and installing required vim plugins.

# WARNING: This script will move your existing configurations (.zshrc, .config directory, 
# Git configs, etc.) to backup files with .old extension. Please make sure you have saved any
# important customizations before proceeding.

# Ask for config directory location
# Set config directory location to ~/.config
XDG_CONFIG_HOME="$HOME/.config"

# Backup existing configuration
if [ -d "$XDG_CONFIG_HOME" ] || [ -L "$XDG_CONFIG_HOME" ]; then
  rm -rf "$XDG_CONFIG_HOME.old"
  mv "$XDG_CONFIG_HOME" "$XDG_CONFIG_HOME.old"
  echo "Backed up existing config directory to $XDG_CONFIG_HOME.old"
fi

# Backup existing zsh configuration
if [ -f "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.old"
  echo "Backed up existing .zshrc to $HOME/.zshrc.old"
fi

# Clone dotfiles repository
echo "Cloning dotfiles repository..."
git clone --depth 1 https://github.com/RWalecki/config.git $XDG_CONFIG_HOME

# Install Vim plugins
echo "Installing Vim plugins..."
VIM_PACK_DIR=$XDG_CONFIG_HOME/vim/pack
mkdir -p $VIM_PACK_DIR/{editor,themes}/start
git clone --depth 1 https://github.com/Shougo/neocomplcache.vim.git $VIM_PACK_DIR/editor/start/neocomplcache.vim.git
git clone --depth 1 https://github.com/scrooloose/nerdcommenter.git $VIM_PACK_DIR/editor/start/nerdcommenter.git
git clone --depth 1 https://github.com/scrooloose/nerdtree.git $VIM_PACK_DIR/editor/start/nerdtree.git
git clone --depth 1 https://github.com/vim-airline/vim-airline.git $VIM_PACK_DIR/editor/start/vim-airline.git
git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git $VIM_PACK_DIR/editor/start/vim-nerdtree-tabs.git
git clone --depth 1 https://github.com/tomasr/molokai.git $VIM_PACK_DIR/themes/start/molokai.git

# Install Homebrew on macOS if needed
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "macOS detected, checking for Homebrew..."
  if [ ! -d "$HOME/.homebrew" ]; then
    echo "Installing Homebrew..."
    git clone --depth 1 https://github.com/Homebrew/brew.git $HOME/.homebrew
  fi
fi

echo "Configuring zsh..."
touch $HOME/.zshrc
cat << EOF >> "$HOME/.zshrc"
export XDG_CONFIG_HOME="\$HOME/.config"
export XDG_CACHE_HOME="\$HOME/.cache"
export HISTFILE="\$XDG_CONFIG_HOME/zsh/.history"

# Then set application-specific configs
source "\$XDG_CONFIG_HOME/zsh/zshenv"
EOF

echo "Installation complete! To start using your new configuration immediately, run 'zsh'."