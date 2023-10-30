#!/bin/bash
set -eu -o pipefail

url="wttr.in?format=%t+%c+%l"
cache=~/.cache/wttr-report.txt
# If cache does not exist or is older than 5m
if ! [[ $(find $cache -mtime -5m 2>/dev/null) ]]; then
  curl -sS --compressed "$url" > "$cache"
fi

awk 'BEGIN {FS = ","}; {print $1}' < "$cache" | sed 's/   /  /g'
