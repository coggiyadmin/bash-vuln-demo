#!/bin/bash
# Combination #13 — ENCODED PAYLOAD × LOGINJ (bash)
raw="$1"
v="$(printf '%b' "$raw")"
logger -t app "user=$v"
