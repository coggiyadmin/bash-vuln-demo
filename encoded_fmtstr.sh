#!/bin/bash
# Combination #13 — ENCODED PAYLOAD × FMTSTR (bash)
raw="$1"
v="$(printf '%b' "$raw")"
printf "$v" "x"
