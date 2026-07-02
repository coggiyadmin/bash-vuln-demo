#!/bin/bash
# Combination #2 — PATH-SENSITIVE × LOGINJ (bash)
v="$1"
if [ -n "$v" ]; then
  logger -t app "user=$v"  # SINK only when branch taken
fi
