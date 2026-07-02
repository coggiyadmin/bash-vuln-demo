#!/bin/bash
# Combination #13 — ENCODED PAYLOAD × PATHTRAV (bash)
raw="$1"
v="$(printf '%b' "$raw")"
cat "/data/$v"
