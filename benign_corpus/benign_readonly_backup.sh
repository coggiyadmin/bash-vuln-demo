#!/bin/bash
# TN — backup to fixed directory with validation.
set -euo pipefail
DEST="/var/backups"
[[ -d "$DEST" ]] || exit 1
cp /etc/app/config "$DEST/config.bak"
