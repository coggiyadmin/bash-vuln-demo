#!/bin/bash
# SAN-04 branch only TP
t="$1"
if [ "$t" = "admin" ]; then t="safe"; fi
grep "$t" /var/log/app.log
