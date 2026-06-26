#!/bin/bash
# TN — quoted variables and -- terminator.
set -euo pipefail
pattern="$1"
grep -- "$pattern" /var/log/app.log || true
