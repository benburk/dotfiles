# Bootstrapping macOS

How I configure my Mac and other devices for getting things done.

# Clean start

I factory reset my computer once a year in order to
- test & evaluate backup strategies
- consider which tools and applications I still like using in my workflow
- clear out loose files and cruft that have accumulated on my system
- upgrade the operating system without breaking things
- make the computer feel like new

macOS Monterey made it easier to reset a Mac using the "Erase All Content and Settings" feature. [Apple Guide](https://support.apple.com/en-ca/HT212749)


# Command line tools

The Command line tools package from Apple provides several development tools, including the Apple LLVM compiler, linker, and Make. The list of tools can be found in the folder `/Library/Developer/CommandLineTools/usr/bin/`.

```bash
xcode-select --install
```

# Zsh

Since macOS Catalina, `zsh` comes installed as the default shell. I use the [Oh-my-zsh](https://ohmyz.sh) framework for configuration and plugins.
```bash
# 1. Install oh-my-zsh (https://ohmyz.sh/#install)

# 2. Download zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

# Homebrew

Homebrew provides a convenient way to install, update, and delete command line tools and applications.

```bash
# 1. Install homebrew (https://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install command line tools I like
brew install rg fd fzf git vale helix tree
/usr/local/opt/fzf/install  # fzf setup

# Quick-look plugins https://www.quicklookplugins.com
brew install --cask qlcolorcode qlstephen

# Utilities
brew install --cask karabiner-elements keepassxc iina qbittorrent cryptomator logisim-evolution selfcontrol

# Applications
brew install --cask telegram visual-studio-code obsidian nordvpn orion jellyfin deezer
```

# Programming

## Rust

```bash
# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install formatting tool
rustup component add rustfmt
```

## Python

For managing multiple Python versions, use `pyenv`.

```bash
brew install python

# linting dependencies
pip install "black==22.8.0" "isort==5.10.1" "mypy==0.991" "pylint==2.15.3" "pytest==7.1.3" "pytest-cov==3.0.0" "refurb" "doctest"
```

## C++

```bash
brew install cmake conan llvm
```

# Dotfiles

At one point, I tried to make everything work out of `$XDG_CONFIG_HOME`. Inevitably, one tool wouldn't respect it and break the convention. I have since opted to define my own dotfile structure and then symlink the files to their appropriate locations.

There exist many [programs](https://wiki.archlinux.org/title/Dotfiles#Tools) to manage dotfiles, but I prefer the simplicity and control of my current setup.

```bash
mkdir ~/dotfiles
git clone https://github.com/chariotsofiron/dotfiles ~/dotfiles
./dotfiles/install_dotfiles
```


# System preferences

The `defaults` command can configure these preferences programmatically. I might move to that. [Example](https://github.com/mathiasbynens/dotfiles/blob/master/.macos)

## Finder

```
General -> New Finder windows show -> SynologyDrive
Sidebar -> Show home directory
Sidebar -> Hide Recents, Documents
Advanced -> Show filename extensions
Advanced -> Don't show warning before changing an extension
Advanced -> Don't show warning before removing from iCloud Drive
Advanced -> Don't show warning before emptying trash
Advanced -> Keep folders on top when sorting by name
Advanced -> When performing a search: Search the current folder
```

## Safari

Paid extensions downloaded via App Store: SponsorBlock, and Wipr.
```
General -> Don't open safe files after downloading
Tabs -> Tab Layout -> Compact
Autofill -> Disable all
Search -> Search engine -> DuckDuckGo
```

## Terminal

```
Download nord theme from https://github.com/arcticicestudio/nord-terminal-app
Profiles -> Import -> Nord.terminal
Nord profile -> Set default
Keyboard -> Use Option as Meta key
```

## System preferences

```
Dock & Menu Bar
- Automatically hide and show the Dock
- Don't show recent applications in Dock
- Battery -> Show percentage
- Clock -> Display the time with seconds
- Spotlight -> Don't show in menu bar
- Siri -> Don't show in menu bar

Mission Control
- Don't Automatically rearrange Spaces based on most recent use

Spotlight
- Enable Applications, Calculator, Conversion, Definition, Music

Keyboard
- Press Globe -> Do Nothing
- Touch Bar shows -> Expanded Control Strip
- Text -> Disable autocorrect, smart quotes, and dashes
- Shortcuts -> Mission Control -> Switch to Desktop 1-9

Trackpad
- Point & Click -> Secondary click -> Click in bottom right corner
- Point & Click -> Tap to click -> Click with one finger
```


# Windows 🖥

1. Install chocolatey
2. Install programs
3. Set up keyboard layout with autohotkey

```bash
choco install -y googlechrome autohotkey qbittorrent vscode minecraft-launcher 7zip.install deezer
```

# Further reading

- [Hardening macOS](https://www.bejarano.io/hardening-macos/)
- [macOS setup guide](https://sourabhbajaj.com/mac-setup/)
- [Ask HN: What feature did you find after years of using macOS? (2020)](https://news.ycombinator.com/item?id=24091707)
- [Making macOS behave itself](https://danmackinlay.name/notebook/macos_hacks.html)
- [macOS command line](https://git.herrbischoff.com/awesome-macos-command-line/about/)
