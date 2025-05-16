# Dotfiles Configuration

This repository contains my personal dotfiles and configuration files for various tools and applications.

## What's Included

- Zsh configuration (`.zshrc`)
- Git configuration (`.gitconfig` and `.gitignore`)
- Vim configuration with popular plugins:
  - neocomplcache.vim (autocompletion)
  - nerdcommenter (commenting)
  - nerdtree (file explorer)
  - vim-airline (status bar)
  - vim-nerdtree-tabs (nerdtree integration)
  - molokai theme

## Installation

To install these configurations, run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/RWalecki/config/refs/heads/master/install.sh)"
```

This will:
1. Backup your existing `.config` directory (if it exists)
2. Copy the configuration files to `~/.config`
3. Create symbolic links for:
   - `.zshrc`
   - `.gitconfig`
   - `.gitignore`
4. Install Vim plugins
5. On macOS, install Homebrew if not already present

## Requirements

- Git
- Bash
- Zsh (for shell configuration)
- Vim (for editor configuration)

## Structure
