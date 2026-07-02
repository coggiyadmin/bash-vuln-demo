#!/bin/bash
# TN — grpc metadata allowlisted.
set -euo pipefail
host="$1"
[[ "$host" == "api.internal.example.com" ]] || exit 1
echo "ok"
