#!/bin/bash
# B-tier PAT-INFO-01 — prints secret env to stdout (CWE-200).

echo "token=${API_TOKEN} user=${1}"  # SINK CWE-200
