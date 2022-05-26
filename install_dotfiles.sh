#!/usr/bin/env bash
# script is idempotent

# Symlink iCloud to home directory
ln -sfh ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/icloud

# get path of the dotfiles folder
# will look like ..dotfiles/setup/..
dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# karabiner elements
mkdir -p ~/.config/karabiner/assets/complex_modifications/
ln -sf "${dotfiles}/karabiner/bold.json" ~/.config/karabiner/assets/complex_modifications/bold.json

# zsh
ln -sf "${dotfiles}/zsh/zshrc" ~/.zshrc

# loose files
ln -sf "${dotfiles}/ignore" ~/.ignore
ln -sf "${dotfiles}/gitignore_global" ~/.gitignore_global
# it's supposed to pick it up automatically but sometimes it doesn't
git config --global core.excludesfile ~/.gitignore_global

# python
# default linting/formatting commands and settings
ln -sf "${dotfiles}/python/pyproject.toml" ~/pyproject.toml
ln -sf "${dotfiles}/python/tasks.py" ~/tasks.py

# tmux
ln -sf "${dotfiles}/tmux/tmux.conf" ~/.tmux.conf

# vscode
ln -sf "${dotfiles}/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json