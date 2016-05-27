# General Settings
set fish_greeting
set fish_term24bit 1

# Exports
set PATH ~/.scripts $PATH
set -x EDITOR "vim -X"
set -x VISUAL vim
set -x LANG "en_US.UTF-8"
set -x MONITOR_PREFS "DP2-1,DP2-8,DP-1-1,DP-1-2,DP-1-3,LVDS2,DVI-0,DVI-1"
set -x INFINALITY_FT_BRIGHTNESS "-10"
set -x INFINALITY_FT_FILTER_PARAMS "0.00 0.35 0.35 0.35 0.00"

# Java GUI in BSPWM
set -x _JAVA_AWT_WM_NONREPARENTING 1

# Base16 Shell
if not set -q SSH_CONNECTION
    eval sh $HOME/.config/base16-shell/base16-ocean.dark.sh
end

# Base16-Ocean Syntax
set fish_color_autosuggestion 65737E EBCB8B
set fish_color_command A3BE8C
set fish_color_comment BF616A
set fish_color_cwd A3BE8C
set fish_color_cwd_root BF616A
set fish_color_error BF616A --bold
set fish_color_escape 96B5B4
set fish_color_history_current 96B5B4
set fish_color_match 96B5B4
set fish_color_normal C0C5CE
set fish_color_operator 96B5B4
set fish_color_param C0C5CE 96B5B4
set fish_color_quote 96B5B4
set fish_color_redirection C0C5CE
set fish_color_search_match --background=343D46
set fish_color_selection --background=343D46
set fish_pager_color_completion C0C5CE
set fish_pager_color_description 65737E
set fish_pager_color_prefix 96B5B4
set fish_pager_color_progress 96B5B4

# Custom Key Bindings
function fish_user_key_bindings
    # Prepend Sudo
    bind \e\e prepend_sudo
    # Start CTRLP Vim plugin
    bind \cp 'vim -c CtrlP'
end

# Title functions
function fish_title --description 'Set terminal title'
    echo $HOSTNAME
end

function fish_tmux_title --description "Set the tmux window title"
    set SUBSTR (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|' | awk '{ print substr( $0, length($0) - 26, length($0) ) }')
    set SUBSTR_LEN (echo "$SUBSTR" | wc -m)
    if [ "$SUBSTR_LEN" -gt 25 ]
        echo "..$SUBSTR"
    else
        echo "$SUBSTR"
    end
end

test $TMUX
    and test (tmux list-panes | wc -l) -eq 1
    and set -x TMUX_PRIMARY_PANE set

function fish_set_tmux_title --description "Sets tmux pane title to output of fish_tmux_title, with padding" --on-variable PWD
    test $TMUX
        and test $TMUX_PRIMARY_PANE
        and printf "\\033k%s\\033\\\\" (fish_tmux_title)
end

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

fish_set_tmux_title
