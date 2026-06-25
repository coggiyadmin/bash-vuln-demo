#!/bin/bash
# Safe mirror — download, GPG-verify detached signature, then install.
set -euo pipefail

PKG_URL="${1}"
SIG_URL="${2}"
TMP="$(mktemp)"
SIG="$(mktemp)"

curl -fsSLo "$TMP" "$PKG_URL"
curl -fsSLo "$SIG" "$SIG_URL"
gpg --verify "$SIG" "$TMP"
sudo dpkg -i "$TMP"
rm -f "$TMP" "$SIG"
