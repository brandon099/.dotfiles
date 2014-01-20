#!/bin/bash

dir=~/.dotfiles
olddir=~/.dotfiles_old

# List of files/folders to symlink in homedir
files="bashrc vimrc vim zshrc oh-my-zsh dircolors"

# Create .dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles..."
mkdir -p $olddir
echo "done"

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Move any existing dotfiles to dotfiles_old directory, and create symlinks
# from the homedir to any files in the ~/dotfiles
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zsh is installed.
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone https://github.com/brandon099/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    detected_distro="Unknown"
    lsbinfo_regex="Description:[[:space:]]*([^ ]*)"
    lsbfile_regex="/etc/(.*)[-_]"

    if [ `which lsb_release 2>/dev/null` ]; then
       lsb_info=`lsb_release -d`
       if [[ $lsb_Info =~ $lsbinfo_regex ]]; then
          detected_distro=${BASH_REMATCH[1]}
       else
          echo "ERROR: Didn't find distro name in lsb_release output"
          exit 1
       fi

    elif
       etcFiles=`ls /etc/*[-_]{release,version} 2>/dev/null`
       for file in $etcFiles; do
          if [[ $file =~ $lsbfile_regex ]]; then
             detected_distro=${BASH_REMATCH[1]}
             break
          else
             echo "ERROR: Didn't find any /etc Files"
             exit 1
          fi
       done

    case $detected_distro in
        suse)   detected_distro="opensuse" ;;
        linux)  detected_distro="linuxmint" ;;
    esac

    if [[ $detected_distro == 'Ubuntu' ]]; then
        sudo apt-get install zsh
        install_zsh

    elif [[ $detected_distro == 'Fedora' ]]; then
        sudo yum install zsh
        install_zsh

    else
        echo "Please install zsh, then re-run this script."
        exit

    fi

fi
}

install_zsh
