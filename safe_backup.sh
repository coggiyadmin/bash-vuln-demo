#!/bin/bash
# SAFE / TN fixture — realistic backup job that handles paths and commands safely.
# All variables are quoted, commands use "--" terminators and array argv, and the
# user-facing argument is confined to a fixed backup root. The scanner MUST produce
# ZERO security findings; any finding here is a FALSE POSITIVE.
set -euo pipefail

BACKUP_ROOT=/var/backups/app
STAMP=$(date +%Y%m%d-%H%M%S)

# Dataset name is allowlisted to a constant before use.
case "${1:-daily}" in
  daily)   dataset="daily" ;;
  weekly)  dataset="weekly" ;;
  *) echo "unknown dataset"; exit 1 ;;
esac

src="${BACKUP_ROOT}/${dataset}"
archive="${BACKUP_ROOT}/${dataset}-${STAMP}.tar.gz"

mkdir -p -- "$BACKUP_ROOT"

# Array argv + "--": user-influenced values are operands, never options or shell.
tar_cmd=(tar -czf "$archive" -C "$src" --)
"${tar_cmd[@]}" .

# Quoted, constant retention sweep within the backup root only.
find "$BACKUP_ROOT" -maxdepth 1 -name '*.tar.gz' -mtime +30 -print -delete

echo "backup written: $archive"
