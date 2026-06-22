#!/bin/bash
# SAFE mirror of chmod_0777.sh (CWE-276). Uses least-privilege permissions.
# ZERO security findings expected.
set -euo pipefail

mkdir -p /var/app/data /var/app/secrets

# Least-privilege: owner-only on secrets, owner-rwx + group-rx on data.
umask 077
chmod 0750 /var/app/data
chmod 0600 /var/app/secrets/* 2>/dev/null || true
