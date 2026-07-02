#!/bin/bash
# Combination #11 — FAN-OUT × FMTSTR (bash)
for v in "$@"; do
  printf "$v" "x"
done
