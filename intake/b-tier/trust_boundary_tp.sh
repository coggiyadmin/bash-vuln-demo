#!/bin/bash
# B-tier PAT-TRUST-01 — client-supplied role written to session file (CWE-501).

ROLE="${1:-guest}"
echo "role=${ROLE}" > "/tmp/session-${USER}.ctx"  # SINK CWE-501
