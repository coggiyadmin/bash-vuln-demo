#!/bin/bash
# TP — panel passes user input to shell (CWE-78 intake pattern).
# CVE-2025-48703 class: web panel command execution via unvalidated parameter.

run_panel_cmd() {
    user_cmd="$1"
    sh -c "$user_cmd"  # SINK CWE-78
}

run_panel_cmd "${1}"
