#!/bin/bash
# a script to print the names of all git repos with uncommitted changes
for repo in $(fd "\.git$" --hidden --absolute-path --type d); do
    dir="$(dirname "$repo")"
    cd "$dir"
    status=$(git status --porcelain)
    if [[ $status ]]; then
        # if there are changes, print the directory name in red
        echo -e "\033[0;31m${dir}\033[0m"
        echo "$status"
    fi
    cd ..
done