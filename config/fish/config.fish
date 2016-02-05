# General Settings
set fish_greeting ""

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_color_dirtystate yellow

# Exports
set PATH $PATH ~/.scripts
set EDITOR vim
set VISUAL vim
set LANG "en_US.UTF-8"
set MONITOR_PREFS "DP-1-1,DP-1-2,DP-1-3,LVDS2,DVI-0,DVI-1"
set INFINALITY_FT_BRIGHTNESS "-10"
set INFINALITY_FT_FILTER_PARAMS "0.00 0.35 0.35 0.35 0.00"

# Java GUI in BSPWM
set _JAVA_AWT_WM_NONREPARENTING 1

# Base16 Shell
eval sh $HOME/.config/base16-shell/base16-ocean.dark.sh

# Base16-Ocean Syntax
set fish_color_autosuggestion 65737E EBCB8B
set fish_color_command A3BE8C B48EAD
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
set fish_color_quote AB7967
set fish_color_redirection C0C5CE
set fish_color_search_match --background=343D46
set fish_color_selection --background=343D46
set fish_pager_color_completion C0C5CE
set fish_pager_color_description 65737E EBCB8B
set fish_pager_color_prefix 96B5B4
set fish_pager_color_progress 96B5B4

# Custom Key Bindings
function fish_user_key_bindings
    # Prepend Sudo
    bind \e\e prepend_sudo
end

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
