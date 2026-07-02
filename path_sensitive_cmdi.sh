#!/bin/bash
# Combination #2 — PATH-SENSITIVE × CMDI (bash)
v="$1"
if [ -n "$v" ]; then
  grep "$v" /var/log/app.log  # SINK only when branch taken
fi
