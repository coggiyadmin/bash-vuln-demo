#!/bin/bash
# TN — serverless handler fixed argv.
set -euo pipefail
grep -- "$1" /var/log/app.log || true
