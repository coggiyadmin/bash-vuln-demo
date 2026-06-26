#!/bin/bash
# Safe mirror — PAT-PERMS-01 (least-privilege permissions).

umask 077
chmod 0750 /var/app/data
chmod 0600 /var/app/secrets/* 2>/dev/null || true
