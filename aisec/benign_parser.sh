#!/bin/bash
# TN — benign parser; trims and drops blank lines.
parse_lines() {
  local line
  while IFS= read -r line; do
    line="${line#"${line%%[![:space:]]*}"}"; line="${line%"${line##*[![:space:]]}"}"
    [[ -n "$line" ]] && printf '%s\n' "$line"
  done
}
