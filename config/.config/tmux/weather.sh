#!/bin/bash
set -eu -o pipefail

url="wttr.in/Seattle?format=%t+%l"
cache=~/.cache/wttr-report.txt
# If cache does not exist or is older than 5m
if ! [[ $(find $cache -mmin -5 2>/dev/null) ]]; then
  curl -sS --compressed "$url" > "$cache"
fi

awk 'BEGIN {FS = ","}; {print $1}' < "$cache"
