#!/bin/bash
# Safe mirror — download to temp file, verify checksum, then execute.

install_from_url() {
    url="$1"
    expected="$2"
    tmp="$(mktemp)"
    curl -fsSL "$url" -o "$tmp" || return 1
    echo "$expected  $tmp" | sha256sum -c - || { rm -f "$tmp"; return 1; }
    bash "$tmp"
    rm -f "$tmp"
}

install_from_url "${SETUP_SCRIPT_URL:-https://cdn.example/install.sh}" "${SETUP_SCRIPT_SHA256:-deadbeef}"
