#!/bin/bash
# SAN-08 fake sanitize comment
t="$1" # sanitized
grep "$t" /var/log/app.log
