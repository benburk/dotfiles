#!/usr/bin/env bash

# set dotfiles (realpath (status dirname))
dotfiles=$(realpath "$(dirname "$0")")
echo $dotfiles

# fish
mkdir -p $HOME/.config/fish
ln -sf $dotfiles/fish/config.fish $HOME/.config/fish/

# karabiner elements
mkdir -p $HOME/.config/karabiner/assets/complex_modifications/
ln -sf $dotfiles/karabiner/layer.json $HOME/.config/karabiner/assets/complex_modifications/

# git
ln -sf $dotfiles/git/gitconfig "$HOME/.gitconfig"
ln -sf $dotfiles/git/gitignore_global "$HOME/.gitignore_global"

# helix
mkdir -p $HOME/.config/helix
ln -sf $dotfiles/helix/config.toml "$HOME/.config/helix/config.toml"

# alacritty
mkdir -p $HOME/.config/alacritty
ln -sf $dotfiles/alacritty/alacritty.yml "$HOME/.config/alacritty/alacritty.yml"

# kitty
mkdir -p $HOME/.config/kitty
ln -sf $dotfiles/kitty/kitty.conf "$HOME/.config/kitty/kitty.conf"


