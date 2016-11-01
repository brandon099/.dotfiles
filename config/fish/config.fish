# General Settings
set fish_greeting
set fish_term24bit 1

# Exports
set PATH ~/.scripts $PATH
set -x EDITOR "vim -X"
set -x VISUAL vim
set -x LANG "en_US.UTF-8"
set -x MONITOR_PREFS "DP2-8,DP2-1-8,LVDS2,DVI-0,DVI-1"
set -x INFINALITY_FT_FILTER_PARAMS "11 22 38 22 11"
set -x INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH 0
set -x INFINALITY_FT_FRINGE_FILTER_STRENGTH 0
set -x INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH 10
set -x INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH 25
set -x INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH 50
set -x INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH 25
set -x INFINALITY_FT_STEM_ALIGNMENT_STRENGTH 25
set -x INFINALITY_FT_STEM_FITTING_STRENGTH 25
set -x INFINALITY_FT_GAMMA_CORRECTION "0 100"
set -x INFINALITY_FT_BRIGHTNESS "0"
set -x INFINALITY_FT_CONTRAST "20"
set -x INFINALITY_FT_USE_VARIOUS_TWEAKS true
set -x INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS false
set -x INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT 50
set -x INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE 40
set -x INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS true

# Java GUI in BSPWM
set -x _JAVA_AWT_WM_NONREPARENTING 1

# Base16 Shell
if not set -q SSH_CONNECTION
    eval sh $HOME/.config/base16-shell/scripts/base16-ocean.sh
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
end

# Virtualfish wrapper function
function venvwrapper --description 'Source Virtualfish'
    eval (python -m virtualfish compat_aliases)
end

# Aliases
alias tree="tree --dirsfirst -CF"
alias pyfind='find . -name "*.py"'
alias pygrep='grep -r --include="*.py"'

# SSH Function to override TERM
function ssh
    set -x TERM xterm-256color
    command ssh $argv -F ~/.ssh/config
end

# Title functions including Tmux titles
function fish_title --description 'Set terminal title'
    echo $HOSTNAME
        if test $TMUX
            if [ "fish" != $_ ]
                printf "\\033k%s\\033\\\\" $argv
            else
                set S_HOME (pwd | string replace $HOME '~')

                if [ (string length $S_HOME) -gt 19 ]
                    set S_HOME ".."(echo $S_HOME | string sub -s-19)
                end

                printf "\\033k%s\\033\\\\" $S_HOME
            end
        end
end

# Start X at login
if not set -q SSH_CONNECTION
    if status --is-login
        if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
            exec startx -- -keeptty
        end
    end
end
