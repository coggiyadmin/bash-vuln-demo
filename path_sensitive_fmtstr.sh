#!/bin/bash
# Combination #2 — PATH-SENSITIVE × FMTSTR (bash)
v="$1"
if [ -n "$v" ]; then
  printf "$v" "x"  # SINK only when branch taken
fi
