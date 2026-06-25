#!/bin/bash
# TP — Metro RN CLI launcher passes user port into shell eval (CWE-78 intake pattern).
# CVE-2025-11953 bash companion: dev-server bootstrap with injected port option.

eval "npx @react-native-community/cli start --port ${1}"  # SINK CWE-78
