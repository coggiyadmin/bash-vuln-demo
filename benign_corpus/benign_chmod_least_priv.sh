#!/bin/bash
# TN — least-privilege file permissions.
set -euo pipefail
chmod 0750 /var/app/data
chmod 0600 /var/app/secrets/key 2>/dev/null || true
