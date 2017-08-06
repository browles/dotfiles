#!/bin/bash

dir=`pwd`
dotfiles=".gitconfig .hammerspoon .vim .vimrc .zshrc .tmux.conf .spacemacs .cljfmt .lein"

for file in $dotfiles; do
  if [ -a $HOME/$file ]; then
    echo "$HOME/$file already exists."
  else
    echo "Creating link to $dir/$file at $HOME/$file."
    ln -s $dir/$file $HOME/$file
  fi
done
