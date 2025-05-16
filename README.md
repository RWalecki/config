# Config

This repository contains configuration files for my development environment, focusing on zsh, vim, tmux, and git. These configurations are designed to enhance productivity and provide a consistent development experience across different machines.

## What are dotfiles?

Dotfiles are hidden configuration files found in your home directory that customize your environment. They can improve your productivity and workflow by adjusting settings for your terminal, editor, and other tools.

## Features

- **ZSH Configuration**: Enhanced shell experience with custom aliases and settings
- **Vim Setup**: Includes popular plugins:
  - neocomplcache.vim for autocompletion
  - nerdcommenter for code commenting
  - nerdtree for file navigation
  - vim-airline for status bar
  - molokai theme
- **Git Configuration**: Custom git aliases and settings
- **Tmux Configuration**: Terminal multiplexer setup
- **Cross-platform Support**: Includes macOS-specific configurations (Homebrew)

## Prerequisites

- Git
- Zsh
- Vim
- Tmux (optional)

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/RWalecki/config.git
   cd config
   ```

2. Run the installation script:
   ```sh
   ./install.sh
   ```

3. Install Zsh (if not already installed):
   - On macOS: `brew install zsh`
   - On Ubuntu/Debian: `sudo apt-get install zsh`

4. Start using Zsh:
   ```sh
   exec zsh
   ```

## What Gets Installed

The installation script will:
- Create a backup of your existing `.config` directory to `.config.old`
- Copy configuration files from the `config/` directory to `~/.config/`
- Create symbolic links for:
  - `.zshrc`
  - `.gitconfig`
  - `.gitignore`
- Install Vim plugins
- Set up Homebrew on macOS (if not already installed)

## Warning

Running the installation script will back up your existing configuration files to prevent accidental data loss. Your current `.config` directory will be moved to `.config.old`.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This project is open source and available under the MIT License.

---

Enjoy! I hope these configurations enhance your development experience. Please feel free to leave feedback or suggestions!