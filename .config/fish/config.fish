
# Remove welcome label
set fish_greeting

# FZF Settings
set -x FZF_DEFAULT_COMMAND 'fd --follow ""'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'fd --follow --type directory ""'


set -x EDITOR kak

source (conda info --root)/etc/fish/conf.d/conda.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval (eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

