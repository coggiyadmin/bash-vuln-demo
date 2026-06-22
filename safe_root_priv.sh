#!/bin/bash
# SAFE mirror of root_priv.sh (CWE-250). Drops privileges to a service user before
# running application logic. ZERO security findings expected.
set -euo pipefail

# Privileged setup only, then drop to an unprivileged service account for the work.
mkdir -p /var/app/cache
chown appsvc:appsvc /var/app/cache

# Drop root: application runs as the unprivileged 'appsvc' user.
exec setpriv --reuid=appsvc --regid=appsvc --clear-groups \
  /usr/local/bin/app-worker --serve
