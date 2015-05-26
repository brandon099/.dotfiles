# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Apply 256 color Ocean Dark Base16 theme
BASE16_SHELL="$HOME/.scripts/ocean-dark"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git rsync hg python pylint cp encode64 jira)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.scripts:/usr/bin/core_perl

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export EDITOR=vim

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh

# Credentials
source /home/bclifford/.credentials

# Timezone
export TZ=America/Denver

# bspwm Panel
export PANEL_FIFO="/tmp/panel-fifo"
export XINERAMA=1

export SFDC_DEPTOOL_CONFIG_FILE="/home/bclifford/deptool-config.ini"
export LPASS_DISABLE_PINENTRY=1
