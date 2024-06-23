# Apple Guide for Erase all Content and Settings: https://support.apple.com/en-ca/HT212749


# Install command line tools to /Library/Developer/CommandLineTools/usr/bin/
xcode-select --install


# Install oh-my-zsh (https://ohmyz.sh/#install)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Download zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


# Install homebrew (https://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install command line tools I like
brew install rg fd fzf git vale helix tree
# Quick-look plugins https://www.quicklookplugins.com
brew install --cask qlcolorcode qlstephen
# Utilities
brew install --cask karabiner-elements keepassxc iina qbittorrent cryptomator logisim-evolution selfcontrol
# Applications
brew install --cask telegram visual-studio-code obsidian nordvpn orion jellyfin deezer calibre


# Rust programming language
# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Install formatting tool
rustup component add rustfmt


# Python programming language
brew install python
# linting dependencies
pip install "black==22.8.0" "isort==5.10.1" "mypy==0.991" "pylint==2.15.3" "pytest==7.1.3" "pytest-cov==3.0.0" "refurb" "doctest"


# C++ programming language
brew install cmake conan llvm


# Dotfiles
mkdir ~/dotfiles
git clone https://github.com/chariotsofiron/dotfiles ~/dotfiles
./dotfiles/install_dotfiles


# MISC SETUP

# fzf setup
/usr/local/opt/fzf/install


# Macos settings
# The `defaults` command can configure these preferences programmatically. I might move to that. [Example](https://github.com/mathiasbynens/dotfiles/blob/master/.macos)

# General -> New Finder windows show -> SynologyDrive
# Sidebar -> Show home directory
# Sidebar -> Hide Recents, Documents
# Advanced -> Show filename extensions
# Advanced -> Don't show warning before changing an extension
# Advanced -> Don't show warning before removing from iCloud Drive
# Advanced -> Don't show warning before emptying trash
# Advanced -> Keep folders on top when sorting by name
# Advanced -> When performing a search: Search the current folder

# ## Safari
# General -> Don't open safe files after downloading
# Tabs -> Tab Layout -> Compact
# Autofill -> Disable all
# Search -> Search engine -> DuckDuckGo


# ## Terminal
# Download nord theme from https://github.com/arcticicestudio/nord-terminal-app
# Profiles -> Import -> Nord.terminal
# Nord profile -> Set default
# Keyboard -> Use Option as Meta key


# ## System preferences
# Dock & Menu Bar
# - Automatically hide and show the Dock
# - Don't show recent applications in Dock
# - Battery -> Show percentage
# - Clock -> Display the time with seconds
# - Spotlight -> Don't show in menu bar
# - Siri -> Don't show in menu bar

# Mission Control
# - Don't Automatically rearrange Spaces based on most recent use

# Spotlight
# - Enable Applications, Calculator, Conversion, Definition, Music

# Keyboard
# - Press Globe -> Do Nothing
# - Touch Bar shows -> Expanded Control Strip
# - Text -> Disable autocorrect, smart quotes, and dashes
# - Shortcuts -> Mission Control -> Switch to Desktop 1-9

# Trackpad
# - Point & Click -> Secondary click -> Click in bottom right corner
# - Point & Click -> Tap to click -> Click with one finger
