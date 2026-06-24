#!/bin/bash
# trust_boundary variant: write untrusted input into trusted runtime config.
role="$1"
echo "ROLE=${role}" > /var/app/trusted.env  # SINK CWE-501
