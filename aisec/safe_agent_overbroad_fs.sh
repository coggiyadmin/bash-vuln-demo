#!/bin/bash
# SAFE mirror (OWASP LLM06) — fs tool jailed to a workspace via realpath prefix check.
read_tool_safe() {
  local ws="/var/app/workspace" target
  target="$(realpath -m -- "${ws}/$1")"
  case "$target" in
    "$ws"/*) cat -- "$target" ;;
    *)       echo "escapes jail" >&2; return 1 ;;
  esac
}
