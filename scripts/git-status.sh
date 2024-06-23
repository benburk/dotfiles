for file in $(fd $1 -d 1); do
    cd $file
    if [[ $(git status --porcelain) ]]; then
        echo -e "\033[0;31m${file}\033[0m"
    fi
    git status --porcelain
    cd ..
done
d