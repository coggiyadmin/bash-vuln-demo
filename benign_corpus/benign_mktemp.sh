#!/bin/bash
# TN — unpredictable temp via mktemp.
set -euo pipefail
LOG=$(mktemp)
echo "ok" > "$LOG"
rm -f "$LOG"
