#!/bin/bash
# Combination #11 — FAN-OUT × LOGINJ (bash)
for v in "$@"; do
  logger -t app "user=$v"
done
