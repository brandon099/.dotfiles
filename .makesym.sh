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
    mv ~/.$file ~/.dotfiles_old/
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
else
    echo "Please install zsh, then re-run this script."
    exit
fi
}

install_zsh
