export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/opt/python/libexec/bin/:$PATH"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

FZF_DEFAULT_COMMAND='fd --follow --no-ignore-vcs""'
FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
FZF_ALT_C_COMMAND='fd --follow --no-ignore-vcs --type directory ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias grep='grep -E '

findup() {
    # Search up recursively for a file
    local path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    [ -e "$path"/"$1" ] && echo "$path"/"$1"
}

cheat() {
    # Queries the cht.sh cheatsheet of various Unix commands
    curl cht.sh/$1
}

pyfmt() {
    local config=$(findup "pyproject.toml")
    local files=( $(find . -type f -name '*.py') )

    black --config="$config" "${files[@]}"
    isort --settings-path="$config" "${files[@]}"
}

pycheck() {
    local config=$(findup "pyproject.toml")
    local files=( $(find . -type f -name '*.py') )

    black --config="$config" --diff "${files[@]}"
    isort --settings-path="$config" --diff "${files[@]}"
    pylint --rcfile="$config" "${files[@]}"
    mypy --config-file="$config" "${files[@]}"
}
