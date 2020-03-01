# Remove welcome message
set fish_greeting

# FZF Settings
set -x FZF_DEFAULT_COMMAND 'fd --follow --no-ignore-vcs""'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'fd --follow --no-ignore-vcs --type directory ""'
