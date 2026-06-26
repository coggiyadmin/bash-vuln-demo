#!/bin/bash
# TN — curl only to allowlisted host.
set -euo pipefail
host="$1"
[[ "$host" == "api.internal.example.com" ]] || exit 1
curl -fsS "https://${host}/health"
