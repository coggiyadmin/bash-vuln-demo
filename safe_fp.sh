#!/bin/bash
# FALSE-POSITIVE PROBE — safe bash patterns. The scanner MUST produce ZERO
# security findings. Any finding is a FALSE POSITIVE.

# 1. ALLOWLIST via case — user input only selects among constant actions
case "$1" in
  start|stop|restart) systemctl "$1" myservice ;;   # $1 constrained to 3 literals
  *) echo "invalid action"; exit 1 ;;
esac

# 2. REGEX VALIDATION — reject anything outside a strict allowlist before use
name="$2"
if [[ ! "$name" =~ ^[a-zA-Z0-9_]+$ ]]; then
  echo "invalid name"; exit 1
fi
cat "/etc/app/${name}.conf"          # name validated → no traversal

# 3. printf %q — shell-escape before use
safe=$(printf '%q' "$3")
echo "processing $safe"

# 4. mktemp — secure temp file (not predictable)
tmp=$(mktemp)
echo "data" > "$tmp"

# 5. Quoted, fixed command with numeric validation
count="$4"
if [[ "$count" =~ ^[0-9]+$ ]]; then
  ping -c "$count" 127.0.0.1          # count is numeric-validated, host is constant
fi
