#!/bin/bash
# TN — run as non-root service user when possible.
set -euo pipefail
if [[ "$(id -u)" -eq 0 ]]; then
  su -s /bin/bash appuser -c 'echo ok'
else
  echo ok
fi
