#!/bin/bash
set -eu -o pipefail

tmux-mem-cpu-load -a 1 -v | tr -s " " | sed "s/▏ /▏/"
