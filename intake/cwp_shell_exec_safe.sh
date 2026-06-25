#!/bin/bash
# Safe mirror — fixed argv vector; user input is data arg only.

run_panel_cmd() {
    label="$1"
    printf '%s\n' "$label" | systemd-analyze blame 2>/dev/null || true
}

run_panel_cmd "${1:-default}"
