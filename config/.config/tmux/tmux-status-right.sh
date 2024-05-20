#!/bin/bash
set -eu -o pipefail
cols=$(tmux display-message -p "#{window_width}")

uname=$(uname)
right=""
if [[ "$uname" == "Darwin" ]]; then
  right="$(~/.config/tmux/battery.sh) | $(~/.config/tmux/weather.sh) | $(date -u +'%Y-%m-%d %H:%M %Z')"
else
  right="$(~/.config/tmux/weather.sh) | #{user}@#{host} | $(date -u +'%Y-%m-%d %H:%M %Z')"
fi
if [[ cols -gt 150 ]]; then
  right="$(~/.config/tmux/tmux-mem-cpu-load.sh) | $right"
fi
echo $right
