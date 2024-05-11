#!/bin/bash
set -eu -o pipefail

# Control+Command+Left Click to drag windows
defaults write -g NSWindowShouldDragOnGesture -bool true
# Show file extensions in Finder
defaults write -g AppleShowAllExtensions -bool true
# Search current directory in Finger
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
