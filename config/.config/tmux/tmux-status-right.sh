#!/bin/bash
set -eu -o pipefail
cols=$(tmux display-message -p "#{window_width}")

if [[ cols -lt 150 ]]; then
  echo "$(~/.config/tmux/battery.sh) | $(~/.config/tmux/weather.sh) | $(date -u +'%Y-%m-%d %H:%M %Z')"
else
  echo "$(~/.config/tmux/tmux-mem-cpu-load.sh) | $(~/.config/tmux/battery.sh) | $(~/.config/tmux/weather.sh) | $(date -u +'%Y-%m-%d %H:%M %Z')"
fi
