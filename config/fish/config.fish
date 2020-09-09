# General Settings
set fish_greeting
set fish_term24bit 1

# Exports
set PATH $HOME/.scripts $HOME/.golang/bin $PATH
set -x EDITOR "vim -X"
set -x VISUAL vim
set -x LANG "en_US.UTF-8"
set -x GOPATH $HOME/.golang/
set -x LD_LIBRARY_PATH /lib:/usr/lib:/usr/local/lib
set -x VAGRANT_DEFAULT_PROVIDER libvirt

if test -e $HOME/.bws
    source $HOME/.bws
end

# Java GUI in BSPWM
set -x _JAVA_AWT_WM_NONREPARENTING 1

# Theme
set fish_color_normal normal
set fish_color_command 81a1c1
set fish_color_quote a3be8c
set fish_color_redirection b48ead
set fish_color_end 88c0d0
set fish_color_error ebcb8b
set fish_color_param eceff4
set fish_color_selection white --bold --background=brblack
set fish_color_search_match bryellow --background=brblack
set fish_color_history_current --bold
set fish_color_operator 00a6b2
set fish_color_escape 00a6b2
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_valid_path --underline
set fish_color_autosuggestion 4c566a
set fish_color_user brgreen
set fish_color_host normal
set fish_color_cancel -r
set fish_pager_color_completion normal
set fish_pager_color_description B3A06D yellow
set fish_pager_color_prefix white --bold
set fish_pager_color_progress brwhite --background=cyan
set fish_color_comment 434c5e
set fish_color_match --background=brblue

# Custom Key Bindings
function fish_user_key_bindings
    # Prepend Sudo
    bind \e\e prepend_sudo
end

# Virtualfish wrapper function
eval (python -m virtualfish compat_aliases)

# Aliases
alias tree="tree --dirsfirst -CF"
alias pyfind='find . -name "*.py"'
alias pygrep='grep -r --include="*.py"'
alias ls='ls --color -h --group-directories-first'

# SSH Function to override TERM
function ssh
    set -x TERM xterm-256color
    command ssh $argv -F $HOME/.ssh/config
end

# Title functions including Tmux titles
function fish_title --description 'Set terminal title'
    echo $HOSTNAME
    if set -q TMUX
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

# Load Git Abbreviations
if status --is-interactive
    if test -e ~/.config/fish/git-abbr.fish
        source $abbr_file
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
