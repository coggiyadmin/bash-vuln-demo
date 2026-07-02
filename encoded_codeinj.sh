#!/bin/bash
# Combination #13 — ENCODED PAYLOAD × CODEINJ (bash)
raw="$1"
v="$(printf '%b' "$raw")"
eval "$v"
