#!/bin/bash
sanitize() { printf '%q' "$1"; }
t="$(sanitize "$1")"
grep -- "$t" /var/log/app.log
