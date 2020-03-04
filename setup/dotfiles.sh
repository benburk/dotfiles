#!/usr/bin/env bash

# Symlink iCloud to home directory
ln -sfh ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/icloud

# get path of the dotfiles folder
# will look like ..dotfiles/setup/..
dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# fish
mkdir -p ~/.config/fish/
ln -sfh $dotfiles/fish/config.fish ~/.config/fish/config.fish

# git
mkdir -p ~/.config/git/
ln -sfh $dotfiles/git/config ~/.config/git/config

# karabiner elements
mkdir -p ~/.config/karabiner/assets/complex_modifications/
ln -sfh $dotfiles/karabine/bold.json ~/.config/karabiner/assets/complex_modifications/bold.json

# loose files
ln -sfh $dotfiles/ignore ~/.ignore
ln -sfh $dotfiles/pylintrc ~/.pylintrc
