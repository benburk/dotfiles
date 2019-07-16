#!/usr/bin/env bash
# macOS bootstrap script
# idempotent, directory-independent
# hope is that if things aren't working I can retrace my steps with this


echo "Symlinking iCloud to home directory..."
ln -sfh ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud

dotfiles() {
    # Pull dotfiles if already exists otherwise clone it
    echo "Updating dotfiles directory..."
    dotfiles="$HOME/iCloud/repos/dotfiles"
    git clone https://github.com/benburk/dotfiles.git $dotfiles

    echo "Symlinking configs..."
    ln -sfh $dotfiles/tmux.conf ~/.tmux.conf
    ln -sfh $dotfiles/ignore ~/.ignore
    ln -sfh $dotfiles/config ~/.config
}

homebrew() {
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
        visual-studio-code
    )


    echo "Installing packages..."
    brew install ${brews[@]}
}


python() {
    echo "Configuring python..."
    pips=(
        black
        pylint
    )
    # anaconda support
    # set -U fish_user_paths /anaconda3/bin $fish_user_paths
}


kakoune() {
    echo "Configuring Kakoune editor..."
    brew install kakoune --HEAD
    # Install plug.kak
    mkdir -p ~/.config/kak/plugins/
    git clone https://github.com/andreyorst/plug.kak.git ~/.config/kak/plugins/plug.kak
    # Install kak-lsp
    brew install ul/kak-lsp/kak-lsp
    pip install 'python-language-server[all]'
    pip install pyls-black pyls-isort
}


fish() {
    echo "Configuring Fish shell..."
    # echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    # chsh -s /usr/local/bin/fish
    # fish_config
}


system() {
    echo "Configuring System Preferences..."

    # Finder > Preferences > Show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    # Finder > Preferences > Show warning before changing an extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    # Finder > Preferences > Show warning before removing from iCloud Drive
    defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
    # Finder > View > Show Path Bar
    defaults write com.apple.finder ShowPathbar -bool true

    # Safari > General > Open safe files after downloading
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
    # Safari > Autofill > Autofill webforms
    defaults write com.apple.Safari AutoFillFromAddressBook -bool false
    defaults write com.apple.Safari AutoFillPasswords -bool false
    defaults write com.apple.Safari AutoFillCreditCardData -bool false
    defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

    # Sysprefs > Trackpad > Tap to click
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    # Sysprefs > Mission Control > Auto rearrange spaces based on most recent use
    defaults write com.apple.dock mru-spaces -bool false
    # Sysprefs > Dock > Automatically hide and show the Dock:
    defaults write com.apple.dock autohide -bool true

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
    system
    echo "bootstrapping complete!"
}
main