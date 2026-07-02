#!/bin/bash
# Combination #3 — LOOP-CARRIED TAINT × FMTSTR (bash)
items=()
for x in "$@"; do items+=("$x"); done
v="${items[0]:-}"
printf "${items[0]}" "x"
