# Dotfiles

This repository organizes the configuration files for the tools and applications I use. The `install_dotfiles.sh` script takes the various files and symlinks them to their expected location.

At one point, I tried to make everything work out of `$XDG_CONFIG_HOME`. Inevitably, one tool wouldn't respect it and break the convention. I have since opted to define my own dotfile structure and then symlink the files to their appropriate locations.

There exist many [programs](https://wiki.archlinux.org/title/Dotfiles#Tools) to manage dotfiles, but I prefer the simplicity and control of my current setup.


## Further reading

- [Hardening macOS](https://www.bejarano.io/hardening-macos/)
- [macOS setup guide](https://sourabhbajaj.com/mac-setup/)
- [Ask HN: What feature did you find after years of using macOS? (2020)](https://news.ycombinator.com/item?id=24091707)
- [Making macOS behave itself](https://danmackinlay.name/notebook/macos_hacks.html)
- [macOS command line](https://git.herrbischoff.com/awesome-macos-command-line/about/)
