#!/bin/bash
# CWE-276 — Incorrect default permissions (world-writable). Tier-A CWE-699 probe.
# Application data and secrets are made world-readable/writable. Expected today:
# may mistype (Python reference showed 276 -> xss mistype) or FN.

mkdir -p /var/app/data

# SINK (CWE-276): 0777 grants every local user read/write/execute.
chmod 0777 /var/app/data
chmod -R 777 /var/app/secrets
umask 000   # new files created world-writable too
