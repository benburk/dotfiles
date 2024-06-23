#!/usr/bin/env bash

# This script symlinks the config files to their correct locations and names
# It is idempotent

# set dotfiles (realpath (status dirname))
dotfiles=$(realpath "$(dirname "$0")")
echo $dotfiles

# fish
mkdir -p $HOME/.config/fish
ln -sf $dotfiles/fish/config.fish $HOME/.config/fish/

# karabiner elements
mkdir -p $HOME/.config/karabiner/assets/complex_modifications/
ln -sf $dotfiles/karabiner/bold_layout.json $HOME/.config/karabiner/assets/complex_modifications/
ln -sf $dotfiles/karabiner/capslock.json $HOME/.config/karabiner/assets/complex_modifications/

# git
ln -sf $dotfiles/git/config.toml "$HOME/.gitconfig"
ln -sf $dotfiles/git/gitignore_global "$HOME/.gitignore_global"
ln -sf $dotfiles/git/ignore "$HOME/.ignore"

# helix
mkdir -p $HOME/.config/helix
ln -sf $dotfiles/helix/config.toml "$HOME/.config/helix/config.toml"
ln -sf $dotfiles/helix/languages.toml "$HOME/.config/helix/languages.toml"

# alacritty
mkdir -p $HOME/.config/alacritty
ln -sf $dotfiles/alacritty/alacritty.yml "$HOME/.config/alacritty/alacritty.yml"

# kitty
mkdir -p $HOME/.config/kitty
ln -sf $dotfiles/kitty/kitty.conf "$HOME/.config/kitty/kitty.conf"

# zellij
mkdir -p $HOME/.config/zellij
ln -sf $dotfiles/zellij/config.kdl "$HOME/.config/zellij/config.kdl"

# python
ln -sf $dotfiles/python/pyproject.toml "$HOME/pyproject.toml"

