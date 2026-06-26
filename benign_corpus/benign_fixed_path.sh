#!/bin/bash
# TN — fixed PATH before invoking utilities.
set -euo pipefail
export PATH="/usr/bin:/bin"
tar czf /tmp/backup.tgz /etc/app
