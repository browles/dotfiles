#!/bin/bash
set -eu -o pipefail

apt install stow

apt install zsh zsh-syntax-highlighting

apt install curl wget parallel lsb-release gpg

apt install fzf ripgrep fd-find tree autojump htop jq

apt install tmux

apt install neovim git-delta

apt install golang-go nodejs npm rbenv rustc

apt install sqlite3 postgresql
snap install redis

curl https://pyenv.run | bash

go install github.com/charmbracelet/glow@latest

mkdir -p $HOME/bin
ln -s `which nvim` $HOME/bin/nvim
ln -s `which fdfind` $HOME/bin/fd
