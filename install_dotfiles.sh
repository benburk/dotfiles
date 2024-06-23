#!/usr/bin/env bash
# script is idempotent

# get path of the dotfiles folder
# will look like ..dotfiles/setup/..
dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# karabiner elements
mkdir -p ~/.config/karabiner/assets/complex_modifications/
ln -sf "${dotfiles}/karabiner/layer.json" ~/.config/karabiner/assets/complex_modifications/

# zsh
ln -sf "${dotfiles}/zsh/zshrc" ~/.zshrc

# fzf ignore
ln -sf "${dotfiles}/fzf/ignore" ~/.ignore

# python
ln -sf "${dotfiles}/python/pyproject.toml" ~/pyproject.toml

# tmux
ln -sf "${dotfiles}/tmux/tmux.conf" ~/.tmux.conf

# vscode
ln -sf "${dotfiles}/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json

# git
ln -sf "${dotfiles}/git/gitconfig" ~/.gitconfig
ln -sf "${dotfiles}/git/gitignore_global" ~/.gitignore_global

# vale
ln -sf "${dotfiles}/vale/vale.ini" ~/.vale.ini
ln -sf "${dotfiles}/vale/vale_styles" ~/
