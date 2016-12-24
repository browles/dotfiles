#!/bin/sh
dir="$HOME/Dropbox/dotfiles"
dotfiles=".emacs.d .ssh .gitconfig .zshrc"

for file in $dotfiles; do
  echo Creating link to $dir/$file at $HOME/$file
  ln -s $dir/$file $HOME/$file
done
