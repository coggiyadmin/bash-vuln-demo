#!/bin/bash
# Combination #2 — PATH-SENSITIVE × CODEINJ (bash)
v="$1"
if [ -n "$v" ]; then
  eval "$v"  # SINK only when branch taken
fi
