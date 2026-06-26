#!/bin/bash
# Safe mirror — allowlist maps user token to constant host (mirrors safe_cmd_injection.sh).

case "${1}" in
  prod)    host="prod.internal.example.com" ;;
  staging) host="staging.internal.example.com" ;;
  *) echo "unknown target"; exit 1 ;;
esac
ping -c 3 "$host"
