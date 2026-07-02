#!/bin/bash
# Combination #2 — PATH-SENSITIVE × PATHTRAV (bash)
v="$1"
if [ -n "$v" ]; then
  cat "/data/$v"  # SINK only when branch taken
fi
