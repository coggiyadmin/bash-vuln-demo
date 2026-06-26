#!/bin/bash
# TP — diagnostic hook runs user command via sudo (CWE-78 intake pattern).
# CVE-2021-36380 class: network management panel command injection.

sudo sh -c "${1}"  # SINK CWE-78
