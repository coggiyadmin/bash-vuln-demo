#!/bin/bash
# B-tier PAT-TRUST-01 safe — role from server-side lookup only.

USER_ID="${1:?user required}"
ROLE=$(grep "^role=" "/etc/app/users/${USER_ID}" | cut -d= -f2)
install -m 600 /dev/null "/var/lib/app/session-${USER_ID}.ctx"
echo "role=${ROLE}" > "/var/lib/app/session-${USER_ID}.ctx"
