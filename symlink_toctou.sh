#!/bin/bash
# CWE-59 — Link following / symlink TOCTOU. Tier-A CWE-699 probe.
# A predictable temp path is written without checking whether it is a symlink, so
# an attacker can pre-create a symlink to a sensitive file and redirect the write.
# Expected today: likely FN (symlink-follow rule is a gap).

LOG=/tmp/app-import.log   # predictable, world-writable location

# SINK (CWE-59): no lstat/-h check, no O_NOFOLLOW — follows an attacker symlink.
echo "import started" > "$LOG"
cat /etc/app/data >> "$LOG"
