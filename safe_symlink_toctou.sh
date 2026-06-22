#!/bin/bash
# SAFE mirror of symlink_toctou.sh (CWE-59). Uses mktemp (unpredictable) and
# refuses to follow symlinks. ZERO security findings expected.
set -euo pipefail

LOG=$(mktemp)   # unpredictable name, created O_EXCL by mktemp

# Refuse to operate on a symlink; write only to the freshly-created temp file.
if [[ -L "$LOG" ]]; then echo "refusing symlink"; exit 1; fi
echo "import started" > "$LOG"
cat /etc/app/data >> "$LOG"
