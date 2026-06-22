#!/bin/bash
# SAFE / FP probe for path-traversal (CWE-22). Tainted input is constrained to a
# fixed base directory with no "../" escape. The scanner MUST produce ZERO security
# findings; any path_traversal finding here is a FALSE POSITIVE.
set -euo pipefail

BASE=/etc/app/conf

# 1. Strict allowlist regex — reject slashes, dots, anything but [a-z0-9_].
name="$1"
if [[ ! "$name" =~ ^[a-z0-9_]+$ ]]; then
  echo "invalid name"; exit 1
fi
cat -- "${BASE}/${name}.conf"

# 2. basename strips any directory component before use.
requested="$2"
leaf=$(basename -- "$requested")
cat -- "${BASE}/${leaf}"

# 3. Canonicalize and confirm the resolved path stays under BASE.
target=$(realpath -m -- "${BASE}/$3")
case "$target" in
  "$BASE"/*) cat -- "$target" ;;
  *) echo "path escapes base"; exit 1 ;;
esac
