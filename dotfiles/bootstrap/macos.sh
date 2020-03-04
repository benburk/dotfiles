#!/usr/bin/env bash

# macOS bootstrap script
# idempotent, directory-independent
# 1. download and symlink dotfiles
# 2. configure a few system preferences

: '
## Install a fresh copy of macOS
1. Boot into recovery mode (hold `cmd+r` during reboot)
2. Format the boot drive and install macOS from scratch

3. Install command line tools
Includes `clang`, `gcc`, `git`, and `make` among others.
You can view all of them by browsing `/Library/Developer/CommandLineTools`.
Install them with:
sudo xcode-select --install

7. Some other settings
Set default applications
- file with type -> get info -> open with -> change all

Manual:
- finder -> new window shows icloud
- safari -> show status bar
- trackpad -> secondary click -> click in bottom right corner
- Keyboard -> Shortcuts -> Mission Control -> ^n to switch to desktop n
- Keyboard -> Dictation -> Shortcut -> Right command key twice
- Accessibility -> Zoom -> Use scroll gesture with modifier keys

## Links
- [Hardening macOS](https://blog.bejarano.io/hardening-macos.html)
- [macOS setup guide](https://sourabhbajaj.com/mac-setup/)
'



# Symlink iCloud to home directory
ln -sfh ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/icloud

homebrew() {
    # install homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # install packages
    brew install fzf rg fd git
    brew install cask karabiner-elements iina qbittorrent
}

dotfiles() {
    # Pull dotfiles if already exists otherwise clone it
    echo "Updating dotfiles directory..."
    dotfiles="$HOME/icloud/projects/30_ongoing/dotfiles"
    # git clone https://github.com/benburk/dotfiles.git $dotfiles

    echo "Symlinking configs..."
    # ln -sfh $dotfiles/dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -sfh $dotfiles/dotfiles/ ~/.config
    ln -sfh $dotfiles/dotfiles/ignore ~/.ignore
    ln -sfh $dotfiles/dotfiles/pylintrc ~/.pylintrc
}


system() {
    echo "Configuring System Preferences..."
    # Links...
    # https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12
    # https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
    # https://github.com/mathiasbynens/dotfiles/blob/master/.macos

    # FINDER
    # Finder > Preferences > Show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    # Finder > Preferences > Show warning before changing an extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    # Finder > Preferences > Show warning before removing from iCloud Drive
    defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
    # Finder > View > Show Path Bar
    defaults write com.apple.finder ShowPathbar -bool true

    # SAFARI
    # Safari > General > Open safe files after downloading
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
    # Safari > Autofill > Autofill webforms
    defaults write com.apple.Safari AutoFillFromAddressBook -bool false
    defaults write com.apple.Safari AutoFillPasswords -bool false
    defaults write com.apple.Safari AutoFillCreditCardData -bool false
    defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

    # DOCK
    # Sysprefs > Dock > Show recent applications
    defaults write com.apple.dock show-recents -bool no
    # defaults write com.apple.dock recent-apps -array # intentionally empty
    # Sysprefs > Dock > Automatically hide and show the Dock:
    defaults write com.apple.dock autohide -bool true

    # Sysprefs > Trackpad > Tap to click
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    # Sysprefs > Mission Control > Auto rearrange spaces based on most recent use
    defaults write com.apple.dock mru-spaces -bool false


    # AUTOCORRECT
    # Disable automatic capitalization as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    # Disable smart dashes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    # Disable automatic period substitution as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
    # Disable smart quotes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    # Disable auto-correct
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

    echo "Done. Some changes require logout/restart to take effect."
}

main() {
    dotfiles
    # system
    echo "bootstrapping complete!"
}
main
