#!/bin/bash
# SAFE mirror — allowlisted commands only.
shell_tool() {
  case "$1" in
    pwd|date) "$1" ;;
    *) echo "not allowed" >&2; return 1 ;;
  esac
}
