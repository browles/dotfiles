#!/bin/bash
set -eu -o pipefail

brew install stow

brew install zsh zsh-syntax-highlighting readline

brew install coreutils findutils grep gnu-sed gnu-tar watch curl wget parallel

brew install fzf ripgrep fd tree autojump htop glow jq

brew install tmux tmux-mem-cpu-load

brew install neovim lazygit git-delta

brew install pyenv python rbenv ruby yarn node go

brew install sqlite redis postgresql@14

brew services start postgresql@14
brew services start redis

curl https://sh.rustup.rs -sSf | sh

find -L /opt/homebrew/opt -path '/opt/homebrew/opt/*/gnubin/*' -exec \
  sh -c 'ln -is {} /usr/local/bin/$(basename {})' \;

# Control+Command+Left Click to drag windows
defaults write -g NSWindowShouldDragOnGesture -bool true
# Configuring Finder:
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# Show file extensions
defaults write -g AppleShowAllExtensions -bool true
# Search current directory
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
