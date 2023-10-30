#!/bin/bash
set -eu -o pipefail

battery=$(pmset -g batt)
percent=$(echo "$battery" | grep -Eo "[0-9]+%" | rev | cut -c2- | rev)
charging=$(echo "$battery" | grep -Eo "not charging|charging|charged")
if [[ "$percent" -gt 95 ]]; then
  icon=󰁹
elif [[ "$percent" -gt 85 ]]; then
  icon="󰂂"
elif [[ "$percent" -gt 75 ]]; then
  icon="󰂁"
elif [[ "$percent" -gt 65 ]]; then
  icon="󰂀"
elif [[ "$percent" -gt 55 ]]; then
  icon="󰁿"
elif [[ "$percent" -gt 45 ]]; then
  icon="󰁾"
elif [[ "$percent" -gt 35 ]]; then
  icon="󰁽"
elif [[ "$percent" -gt 25 ]]; then
  icon="󰁼"
elif [[ "$percent" -gt 15 ]]; then
  icon="󰁻"
else
  icon="󰁺"
fi

echo "$icon" "$percent"% "($charging)"
