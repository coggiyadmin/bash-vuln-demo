#!/bin/bash
# SAFE mirror of download_no_verify.sh (CWE-494). Verifies a pinned SHA-256 before
# executing the downloaded script. ZERO security findings expected.
set -euo pipefail

EXPECTED=3a7bd3e2360a3d29eea436fcfb7e44c735d117c42d1c1835420b6b9942dd4f1b
TMP=$(mktemp)

curl -fsSLo "$TMP" https://cdn.example.com/setup.sh
# Integrity check: refuse to run unless the pinned checksum matches.
echo "${EXPECTED}  ${TMP}" | sha256sum -c - || { echo "checksum mismatch"; exit 1; }
bash "$TMP"
