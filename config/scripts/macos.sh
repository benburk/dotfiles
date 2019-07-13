#!/usr/bin/env bash
# macOS bootstrap script
# idempotent, directory-independent
# hope is that if things aren't working I can retrace my steps with this


echo "Symlinking iCloud to home directory..."
ln -sfh ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud


# Pull dotfiles if already exists otherwise clone it
echo "Updating dotfiles directory..."
dotfiles='/Users/benburk/iCloud/repos/dotfiles'
git -C $dotfiles pull || git clone https://github.com/benburk/dotfiles.git $dotfiles


echo "Symlinking configs..."
ln -sfh $dotfiles/tmux.conf ~/.tmux.conf
ln -sfh $dotfiles/ignore ~/.ignore
ln -sfh $dotfiles/config ~/.config


# Install homebrew if not installed
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Configuring homebrew..."

brew update
brew upgrade

brews=(
    fish
    fd
    rg
    fzf
    tmux
    ranger
    git
)

casks=(
    karabiner-elements
    iina
    youtube-dl
    google-chrome
)

pips=(
    black
    pylint
)

echo "Installing packages..."
brew install ${brews[@]}


echo "Configuring Kakoune editor..."
brew install kakoune --HEAD
# Install plug.kak
mkdir -p ~/.config/kak/plugins/
git clone https://github.com/andreyorst/plug.kak.git ~/.config/kak/plugins/plug.kak
# Install kak-lsp
brew install ul/kak-lsp/kak-lsp
pip install 'python-language-server[all]'
pip install pyls-black pyls-isort


# echo "Configuring Fish shell..."
# echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# chsh -s /usr/local/bin/fish
# fish_config

# # anaconda support
# set -U fish_user_paths /anaconda3/bin $fish_user_paths


echo "bootstrapping complete!"