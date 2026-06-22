#!/bin/bash
# CWE-250 — Execution with unnecessary privileges. Tier-A CWE-699 probe.
# The script requires root for its whole runtime and never drops privileges before
# running application logic / handling input. Expected today: likely FN (run-as-root
# rule is a gap).

# SINK (CWE-250): hard requirement to run as root, no privilege drop afterwards.
if [[ "$EUID" -ne 0 ]]; then
  echo "must run as root"; exit 1
fi

# Application work runs with full root authority (no setuid drop to a service user).
mkdir -p /var/app/cache
/usr/local/bin/app-worker --serve   # serves requests as root
