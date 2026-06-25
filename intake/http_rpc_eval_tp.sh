#!/bin/bash
# TP — HTTP RPC executes untrusted expression (CWE-94 intake pattern).
# CVE-2025-67038 class: device management RPC eval of client-supplied code.

eval "$1"  # SINK CWE-94
