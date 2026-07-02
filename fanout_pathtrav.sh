#!/bin/bash
# Combination #11 — FAN-OUT × PATHTRAV (bash)
for v in "$@"; do
  cat "/data/$v"
done
