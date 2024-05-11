#!/bin/bash
set -eu -o pipefail

# Control+Command+Left Click to drag windows
defaults write -g NSWindowShouldDragOnGesture -bool true
# Configuring Finder:
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# Show file extensions
defaults write -g AppleShowAllExtensions -bool true
# Search current directory
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
