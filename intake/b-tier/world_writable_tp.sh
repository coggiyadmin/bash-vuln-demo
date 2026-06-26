#!/bin/bash
# B-tier PAT-PERMS-01 — world-writable permissions on sensitive file (CWE-276).

chmod 0777 /var/app/data
chmod -R 777 /var/app/secrets
