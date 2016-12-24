#!/bin/sh
dir="$HOME/Dropbox/dotfiles"
dotfiles=".emacs.d .ssh .gitconfig .zshrc .tmux.conf"

for file in $dotfiles; do
  if stat $HOME/$file > /dev/null 2>&1; then
    echo $HOME/$file already exists.
  else
    echo Creating link to $dir/$file at $HOME/$file
    ln -s $dir/$file $HOME/$file
  fi
done
