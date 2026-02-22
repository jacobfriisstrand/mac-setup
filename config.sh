#!/usr/bin/env zsh

DOTFILES=(.zshrc .gitconfig .gitignore)

# Create ~/scripts folder
mkdir ~/scripts

#Remove old dotfiles and replace them
for dotfile in $(echo ${DOTFILES[*]});
do
    rm ~/$(echo $dotfile)
    ln -s ~/mac-setup/dotfiles/$(echo $dotfile) ~/$(echo $dotfile)
done