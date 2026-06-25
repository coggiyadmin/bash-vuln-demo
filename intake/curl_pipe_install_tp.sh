#!/bin/bash
# TP — CI install hook executes remote script via curl|sh (CWE-506 / CWE-78 intake pattern).
# Arg1: setup script URL (unpinned remote install — CVE-2025-30154 pattern).

curl -fsSL "${1}" | sh  # SINK CWE-78
