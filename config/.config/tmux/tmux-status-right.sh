#!/bin/bash
set -eu -o pipefail
cols=$(tmux display-message -p "#{window_width}")

right="$(~/.config/tmux/battery.sh) | $(~/.config/tmux/weather.sh) | $(date -u +'%Y-%m-%d %H:%M %Z')"
if [[ cols -gt 150 ]]; then
  right="$(~/.config/tmux/tmux-mem-cpu-load.sh) | $right"
fi
echo $right
