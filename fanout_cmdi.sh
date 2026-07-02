#!/bin/bash
# Combination #11 — FAN-OUT × CMDI (bash)
for v in "$@"; do
  grep "$v" /var/log/app.log
done
