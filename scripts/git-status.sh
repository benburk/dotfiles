for file in $(fd $1 -d 1); do
    echo -e "\033[0;31m${file}\033[0m"
    cd $file
    git status --porcelain
    cd ..
done
