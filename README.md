# Dotfiles

This repository organizes the configuration files for the tools and applications I use. The `install_dotfiles.sh` script takes the various files and symlinks them to their expected location.

At one point, I tried to make everything work out of `$XDG_CONFIG_HOME`. Inevitably, one tool wouldn't respect it and break the convention. I have since opted to define my own dotfile structure and then symlink the files to their appropriate locations.

There exist many [programs](https://wiki.archlinux.org/title/Dotfiles#Tools) to manage dotfiles, but I prefer the simplicity and control of my current setup.
