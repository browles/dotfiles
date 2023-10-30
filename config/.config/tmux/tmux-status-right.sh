#!/bin/bash
set -eu -o pipefail

echo "$(~/.config/tmux/tmux-mem-cpu-load.sh) | $(~/.config/tmux/battery.sh) | $(~/.config/tmux/weather.sh) | $(date -u +'%Y-%m-%d %H:%M %Z')"
