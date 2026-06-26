#!/bin/bash
# CWE-88 — Argument injection. Tier-A CWE-699 probe.
# User-controlled values passed to CLI tools without "--" separation can inject
# extra flags (e.g. grep "--output=/etc/cron.d/x"). Expected: command_injection fires.

pattern="$1"   # SOURCE — may start with "--"
file="$2"
raw="$3"

# SINK (CWE-88): operands parsed as options — no "--" terminator.
grep "$pattern" /var/log/app.log || true
rm -f "$file"
logger "processed: $raw"
