#!/bin/bash
# TP — cloud controller diagnostic runs user host in shell -c (CWE-78 intake pattern).
# CVE-2024-50603 class: Aviatrix Controller OS command injection via diag parameter.

/bin/bash -c "aviatrix_cli cloud_diag --host ${1}"  # SINK CWE-78
