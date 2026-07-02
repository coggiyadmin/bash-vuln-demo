#!/bin/bash
# Combination #3 — LOOP-CARRIED TAINT × CMDI (bash)
items=()
for x in "$@"; do items+=("$x"); done
v="${items[0]:-}"
grep "${items[0]}" /var/log/app.log
