#!/bin/bash
# PRP-07 optional — cmdi
t="${1:-}"
v="$t"
grep "$v" /var/log/app.log
