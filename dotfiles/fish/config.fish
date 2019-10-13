# # Start tmux on login
# if test "$TERM" = "xterm-kitty"
#     if status is-interactive
#         and not set -q TMUX
#         exec tmux new -A -s base
#     end
# end

# Remove welcome message
set fish_greeting


# FZF Settings
set -x FZF_DEFAULT_COMMAND 'fd --follow --no-ignore-vcs""'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'fd --follow --no-ignore-vcs --type directory ""'


set -Ux EDITOR kak

source (conda info --root)/etc/fish/conf.d/conda.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval (eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

