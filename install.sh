#!/usr/bin/env bash
CONFIG_DIR=$HOME/.config  

# Remove .config.old if it exists and move .config to .config.old
if [ -d "$CONFIG_DIR" ]; then
  rm -rf "$CONFIG_DIR.old"
  mv "$CONFIG_DIR" "$CONFIG_DIR.old"
fi

# git clone --depth 1 git@github.com:RWalecki/config.git $CONFIG_DIR
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cp -r $SCRIPT_DIR/config/ $CONFIG_DIR

ln -sf $CONFIG_DIR/zsh/zshrc $HOME/.zshrc
ln -sf $CONFIG_DIR/git/gitconfig $HOME/.gitconfig
ln -sf $CONFIG_DIR/git/gitignore $HOME/.gitignore

export VIM_PACK_DIR=$CONFIG_DIR/vim/pack
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