#!/bin/bash
# weak_hash TP — md5 for password fingerprint (CWE-328).
echo -n "$1" | md5  # SINK CWE-328
