#!/bin/bash
# TN — verify checksum before executing downloaded script.
set -euo pipefail
curl -fsS -o /tmp/install.sh https://releases.example.com/install.sh
echo "deadbeef  /tmp/install.sh" | sha256sum -c -
