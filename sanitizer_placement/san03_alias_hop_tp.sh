#!/bin/bash
# SAN-03 alias hop ignores sanitize
raw="$1"
_="$raw"
grep "$raw" /var/log/app.log
