# Apply 256 color Ocean Dark Base16 theme
BASE16_SHELL="$HOME/.scripts/ocean-dark"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Exports
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/core_perl:~/.scripts
export EDITOR=vim
export TZ=America/Denver
export SFDC_DEPTOOL_CONFIG_FILE="/home/bclifford/deptool-config.ini"
export LPASS_DISABLE_PINENTRY=1

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh

# bspwm Panel
export PANEL_FIFO="/tmp/panel-fifo"
export XINERAMA=1

# Credentials
source ~/.credentials

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

    # Theme
    zgen load brandon099/oh-my-zsh themes/af-magic bclifford/custom

    # Save zgen init
    zgen save
fi
