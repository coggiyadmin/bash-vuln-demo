#!/bin/bash
# Combination #3 — LOOP-CARRIED TAINT × CODEINJ (bash)
items=()
for x in "$@"; do items+=("$x"); done
v="${items[0]:-}"
eval "${items[0]}"
