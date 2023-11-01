#!/bin/bash
set -u -o pipefail

battery=$(pmset -g batt)
percent=$(echo "$battery" | grep -Po "[0-9]+(?=%)")
charging=$(echo "$battery" | grep -Po 'not charging|(?<!dis)charging')
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
if [[ "$charging" =~ .*"charging" ]]; then
  charging=" ($charging)"
else
  charging=""
fi

echo "$icon" "$percent%$charging"
