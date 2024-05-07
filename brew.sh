#!/bin/bash
set -eu -o pipefail

brew install stow

brew install zsh zsh-syntax-highlighting readline

brew install coreutils findutils grep gnu-sed gnu-tar watch curl wget parallel

brew install fzf ripgrep fd tree autojump htop glow jq

brew install tmux tmux-mem-cpu-load

brew install neovim lazygit git-delta

brew install pyenv python rbenv ruby yarn node go rust

brew install sqlite redis postgresql@14

brew services start postgresql@14

find -L /opt/homebrew/opt -path '/opt/homebrew/opt/*/gnubin/*' -exec \
  sh -c 'ln -is {} /usr/local/bin/$(basename {})' \;
