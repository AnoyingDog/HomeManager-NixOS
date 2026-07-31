#!/usr/bin/env bash
set -eou pipefail

CACHEFILE=~/.cache/scripts/activewindow
export CACHEFILE

touch ${CACHEFILE} && rm $CACHEFILE
hyprctl activewindow | grep -E "initialTitle|initialClass" >> $CACHEFILE
cat ${CACHEFILE} | while read -r OUTPUT; do notify-send "$OUTPUT"; done
