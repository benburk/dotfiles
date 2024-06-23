#!/usr/bin/env fish

set -gx FZF_DEFAULT_COMMAND "fd --type f"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {}'"
set -gx FZF_ALT_C_COMMAND "fd --type d"
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {}'"

fish_add_path --move /usr/local/opt/fzf/bin
fish_add_path --move $HOME/.cargo/bin

if status is-interactive
    set fish_greeting # Suppress fish welcome message
    fish_config theme choose "catppuccin-frappe"
    fish_config prompt choose "Arrow"
    
    set -gx EDITOR hx

    # https://github.com/kovidgoyal/kitty/issues/268
    alias clear="printf '\033[2J\033[3J\033[1;1H'"
end

