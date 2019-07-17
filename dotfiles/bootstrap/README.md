# macOS Bootstrap script
This is my bootsrap script and pre/post instructions for setting up my mac. This is only meant as a reference for other people. It's to serve as inspiration to take parts you like and make your own.

## Manual Steps
Some steps of the process are manual

## Install a fresh copy of macOS
1. Boot into recovery mode (hold cmd+R during reboot
2. (Optional) Utilities -> Firmware password utility
3. Format the boot drive and install macOS from scratch (Warning: this step will permanently delete the contents of the boot drive)

## Manual Settings
**Safari**
- Extensions: bitwarden, wipr, hoverzoom
- View -> Show status bar

**Dock**
- Don’t show recent apps

**Finder**
- General -> new finder window shows "iCloud"

**Terminal**
- Install Nord theme
- Profile -> Keyboard -> Use option as meta key
- Profile -> Uncheck scroll alternate screen

**Trackpad**
- Secondary click -> Click in bottom right corner

**Keyboard**
- Shortcuts -> Mission Control -> ^n to switch to desktop n
- Dictation -> Shortcut -> Right command key twice (fn key used as hyper in karabiner)

**Accesibility**
- Zoom -> Use scroll gesture with modifier keys


## References
- [Hardening macOS](blog.bejarano.io/hardening-macos.html)


## Similar Projects
- https://gist.github.com/mrichman/f5c0c6f0c0873392c719265dfd209e12
- https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
- https://github.com/mathiasbynens/dotfiles/blob/master/.macos

------
https://github.com/sindresorhus/quick-look-plugins
qlcolorcode qlmarkdown qlprettypatch qlstephen \
	qlimagesize \
	quicklook-csv quicklook-json epubquicklook