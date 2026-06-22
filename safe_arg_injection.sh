#!/bin/bash
# SAFE / FP probe for argument-injection (CWE-88). Tainted values are separated from
# option parsing with the "--" terminator and/or shell-escaped, so user data can never
# be interpreted as a flag. The scanner MUST produce ZERO security findings; any
# argument_injection / command_injection finding here is a FALSE POSITIVE.
set -euo pipefail

# 1. "--" terminator — everything after it is treated as operands, never options,
#    so a value like "--exec=..." cannot smuggle a flag into grep/rm/curl.
pattern="$1"
grep -- "$pattern" /var/log/app.log || true

file="$2"
rm -f -- "$file"

# 2. printf %q escapes the value before it is embedded anywhere.
raw="$3"
safe=$(printf '%q' "$raw")
logger "processed: $safe"

# 3. Explicit option/value split — curl URL passed positionally after "--".
url_path="$4"
[[ "$url_path" =~ ^[A-Za-z0-9/_-]+$ ]] || { echo "bad path"; exit 1; }
curl -fsS -- "https://api.example.com/${url_path}"
