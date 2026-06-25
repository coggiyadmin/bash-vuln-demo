#!/bin/bash
# TP — compromised mirror serves unsigned install script (CWE-506 / CWE-494 intake).
# CVE-2026-8398 class: official installer pulls from tainted package mirror, no integrity check.

curl -fsSL "${1}/install.sh" | bash  # SINK CWE-78 / supply-chain class
