#!/bin/bash

dir=~/.dotfiles
olddir=~/.dotfiles_old

# List of files/folders to symlink in homedir
files="bashrc vimrc vim zshrc dircolors gitconfig scripts Xresources config compton.conf xinitrc tmux.conf zgen.zsh dircolors"

# Create .dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles..."
mkdir -p $olddir
echo "done"

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Grab zgen from Github
if [ ! -f zgen.zsh ]; then
    curl -Os https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh
fi

# Move any existing dotfiles to dotfiles_old directory, and create symlinks
# from the homedir to any files in the ~/dotfiles
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/.dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
