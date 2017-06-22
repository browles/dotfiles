#!/bin/bash

dir="$HOME/Dropbox/dotfiles"
dotfiles=".gitconfig .vim .vimrc .zshrc .tmux.conf .spacemacs .cljfmt"

for file in $dotfiles; do
  if [ -a $HOME/$file ]; then
    echo "$HOME/$file already exists."
    
  else
    echo "Creating link to $dir/$file at $HOME/$file."
    ln -s $dir/$file $HOME/$file
  fi
done
