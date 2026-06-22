#!/bin/bash
# SAFE mirror of search_path.sh (CWE-426/427). Uses a fixed, trusted PATH and
# absolute command paths. ZERO security findings expected.
set -euo pipefail

# Trusted, absolute PATH only — no ".", no writable user dirs.
export PATH=/usr/bin:/bin

# Absolute binary paths — not resolved through an attacker-influenced PATH.
/bin/tar czf backup.tgz /etc/app
/bin/gzip -f backup.tgz
