#!/bin/bash
# CWE-426/427 — Untrusted / uncontrolled search path. Tier-A CWE-699 probe.
# A relative / attacker-influenced directory is prepended to PATH before invoking
# a bare command name, so a malicious `tar` in the cwd is executed instead of the
# system one. Expected today: likely FN (search-path rule is a gap).

# SINK (CWE-426/427): "." and a writable dir prepended; bare command resolved via PATH.
export PATH=".:/tmp/userbin:$PATH"

# Resolves `tar`/`gzip` through the poisoned PATH — attacker-controlled binary runs.
tar czf backup.tgz /etc/app
gzip -f backup.tgz
