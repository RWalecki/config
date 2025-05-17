#!/usr/bin/env bash
# ask for config dir and default to $HOME/.config 
read -p "Enter location of config dir [$HOME/.config] (Y to confirm, or enter custom path): " CONFIG_RESPONSE
if [[ "$CONFIG_RESPONSE" == "Y" || "$CONFIG_RESPONSE" == "y" || "$CONFIG_RESPONSE" == "" ]]; then
  CONFIG_DIR="$HOME/.config"
else
  CONFIG_DIR="$CONFIG_RESPONSE"
fi

# Remove .config.old if it exists and move .config to .config.old
if [ -d "$CONFIG_DIR" ] || [ -L "$CONFIG_DIR" ]; then
  rm -rf "$CONFIG_DIR.old"
  mv "$CONFIG_DIR" "$CONFIG_DIR.old"
fi

if [ -f "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.old"
fi

# this has to be replaced with git clone
git clone --depth 1 git@github.com:RWalecki/config.git $CONFIG_DIR
# SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
# cp -r $SCRIPT_DIR/dotfiles $CONFIG_DIR

export VIM_PACK_DIR=$CONFIG_DIR/vim/pack
mkdir -p $VIM_PACK_DIR/{editor,themes}/start
git clone --depth 1 https://github.com/Shougo/neocomplcache.vim.git $VIM_PACK_DIR/editor/start/neocomplcache.vim.git
git clone --depth 1 https://github.com/scrooloose/nerdcommenter.git $VIM_PACK_DIR/editor/start/nerdcommenter.git
git clone --depth 1 https://github.com/scrooloose/nerdtree.git $VIM_PACK_DIR/editor/start/nerdtree.git
git clone --depth 1 https://github.com/vim-airline/vim-airline.git $VIM_PACK_DIR/editor/start/vim-airline.git
git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git $VIM_PACK_DIR/editor/start/vim-nerdtree-tabs.git
git clone --depth 1 https://github.com/tomasr/molokai.git $VIM_PACK_DIR/themes/start/molokai.git

# install homebrew on macos
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ ! -d "$HOME/.homebrew" ]; then
    git clone --depth 1 https://github.com/Homebrew/brew.git $HOME/.homebrew
  fi
fi


ln -sf $CONFIG_DIR/gitconfig $HOME/.gitconfig
ln -sf $CONFIG_DIR/gitignore $HOME/.gitignore

touch $HOME/.zshrc
cat << EOF >> "$HOME/.zshrc"
export CONFIG_DIR=$CONFIG_DIR
source $CONFIG_DIR/zshenv
export VIMINIT='source $CONFIG_DIR/vim/vimrc'
export TMUX_CONFIG=$CONFIG_DIR/tmux.conf
EOF

# start zsh
zsh