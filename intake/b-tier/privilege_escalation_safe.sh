#!/usr/bin/env bash
# Safe mirror — PAT-PRIV-01
if [[ "${IS_STAFF:-}" != "1" ]]; then
  echo "forbidden" >&2
  exit 1
fi
echo "elevated"
