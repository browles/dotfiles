#!/bin/bash
set -eu -o pipefail

apt install stow

apt install zsh zsh-syntax-highlighting

apt install curl wget parallel lsb-release gpg make cmake

apt install fzf ripgrep fd-find tree autojump htop jq bat

apt install tmux

apt install neovim git-delta

apt install golang-go nodejs npm rbenv python3-pip python3-venv

apt install sqlite3 postgresql
snap install redis

curl https://sh.rustup.rs -sSf | sh
curl https://pyenv.run | bash

go install github.com/charmbracelet/glow@latest

mkdir -p $HOME/bin
ln -s `which nvim` $HOME/bin/nvim
ln -s `which fdfind` $HOME/bin/fd
ln -s `which batcat` $HOME/bin/bat
