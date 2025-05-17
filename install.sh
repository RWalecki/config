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
read -p "Enter location of config dir [$HOME/.config] (Y to confirm, or enter custom path): " CONFIG_RESPONSE
if [[ "$CONFIG_RESPONSE" == "Y" || "$CONFIG_RESPONSE" == "y" || "$CONFIG_RESPONSE" == "" ]]; then
  XDG_CONFIG_HOME="$HOME/.config"
else
  XDG_CONFIG_HOME="$CONFIG_RESPONSE"
fi

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
git clone --depth 1 git@github.com:RWalecki/config.git $XDG_CONFIG_HOME

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

# Create git configuration symlinks
echo "Setting up Git configuration..."
ln -sf $XDG_CONFIG_HOME/gitconfig $HOME/.gitconfig
ln -sf $XDG_CONFIG_HOME/gitignore $HOME/.gitignore

# Create new zshrc with proper configuration
echo "Configuring zsh..."
touch $HOME/.zshrc
cat << EOF >> "$HOME/.zshrc"
export XDG_CONFIG_HOME="/Users/Robert/.config"
export XDG_CACHE_HOME="/Users/Robert/.cache"

# Then set application-specific configs
source "$XDG_CONFIG_HOME/zsh/zshenv"
EOF

echo "Installation complete! To start using your new configuration immediately, run 'zsh'."