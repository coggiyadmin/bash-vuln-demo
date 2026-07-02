#!/bin/bash
# Combination #13 — ENCODED PAYLOAD × CMDI (bash)
raw="$1"
v="$(printf '%b' "$raw")"
grep "$v" /var/log/app.log
