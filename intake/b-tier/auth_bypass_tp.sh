#!/bin/bash
# B-tier PAT-AUTH-01 — destructive action without auth (CWE-306).

rm -rf "/var/app/users/${1}"  # SINK CWE-306 — no auth gate
