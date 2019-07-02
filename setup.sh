#!/bin/bash

dir=`pwd`
dotfiles=".gitconfig .ignore .hammerspoon .vim .vimrc \
	.zshrc .zshenv .tmux.conf.local .spacemacs .cljfmt .lein/profiles.clj"

for file in $dotfiles; do
  if [ -a $HOME/$file ]; then
    echo "$HOME/$file already exists."
  else
    echo "Creating link to $dir/$file at $HOME/$file."
    ln -s $dir/$file $HOME/$file
  fi
done
