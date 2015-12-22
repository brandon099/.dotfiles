# Apply 256 color Ocean Dark Base16 theme
BASE16_SHELL="$HOME/.scripts/ocean-dark"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Source dircolors config
if [[ -f ~/.dircolors ]] ; then
    eval $(dircolors -b ~/.dircolors)
fi

# Exports
export PATH=$PATH:~/.scripts
export EDITOR=vim
export VISUAL=vim
export TZ=America/Denver
export LANG="en_US.UTF-8"
export SFDC_DEPTOOL_CONFIG_FILE="/home/bclifford/deptool-config.ini"
export LPASS_DISABLE_PINENTRY=1
export QT_STYLE_OVERRIDE=GTK+
export MONITOR_PREFS="DP-1-1,DP-1-2,DP-1-3,LVDS2,DVI-0,DVI-1"
export PURE_GIT_DOWN_ARROW="↓"
export PURE_GIT_UP_ARROW="↑"

# ZSH Functions
if [  -f ~/.zfuncs ]; then
    source ~/.zfuncs
fi

# Neovim if installed
if [ -f /usr/sbin/nvim ]; then
    alias vim=nvim
    export GIT_EDITOR=nvim
    export VISUAL=nvim
    export EDITOR=nvim
fi

# Virtualenvwrapper
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
fi

# bspwm Panel
export PANEL_FIFO="/tmp/panel-fifo"
export XINERAMA=1

# Java GUI in BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1

# Credentials
if [  -f ~/.credentials ]; then
    source ~/.credentials
fi

# Load zgen
source ~/.zgen.zsh

# Check for init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # Plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/pylint
    zgen oh-my-zsh plugins/cp
    zgen oh-my-zsh plugins/encode64
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load mafredri/zsh-async
    zgen load brandon099/pure

    # Save zgen init
    zgen save
fi
