#!/bin/bash
# Combination #3 — LOOP-CARRIED TAINT × PATHTRAV (bash)
items=()
for x in "$@"; do items+=("$x"); done
v="${items[0]:-}"
cat "/data/${items[0]}"
