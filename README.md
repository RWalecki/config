# Dotfiles Configuration
If you're using Zsh, Git, Vim, and VS Code, you'll definitely find useful configurations in this repository. It includes customized setups for all these tools, complete with Vim plugins (neocomplcache, nerdcommenter, nerdtree, vim-airline, etc.), and dedicated configuration directories for each tool. Just run the provided installation script to get started. But make sure to backup your files before trying. Leave me a comment if you find these configurations useful or find something that could be improved!

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