# Dotfiles Configuration

Personal dotfiles and configurations for my development environment.

## Includes
- Zsh, Git, and Vim configurations with plugins (neocomplcache, nerdcommenter, nerdtree, vim-airline, vim-nerdtree-tabs, molokai theme)

## Install
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/RWalecki/config/refs/heads/master/install.sh)"
```

The installer backs up existing configs, copies new files to `~/.config`, creates symlinks, installs Vim plugins, and sets up Homebrew on macOS.

## Requirements
Git, Bash, Zsh, Vim

## Structure
- `git/` - Git configuration files
- `vim/` - Vim configuration and plugins
- `zsh/` - Zsh shell configuration
- `vscode/` - VS Code settings
- `tmux/` - Tmux configuration
- `install.sh` - Installation script