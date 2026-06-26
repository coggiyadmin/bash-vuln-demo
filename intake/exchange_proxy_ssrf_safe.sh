#!/bin/bash
# Safe mirror — host allowlist before outbound fetch.

case "${1}" in
  https://api.internal.example.com/*) url="$1" ;;
  https://cdn.example.com/*) url="$1" ;;
  *) echo "forbidden"; exit 1 ;;
esac
curl -fsSL "$url"
