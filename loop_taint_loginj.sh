#!/bin/bash
# Combination #3 — LOOP-CARRIED TAINT × LOGINJ (bash)
items=()
for x in "$@"; do items+=("$x"); done
v="${items[0]:-}"
logger -t app "user=${items[0]}"
