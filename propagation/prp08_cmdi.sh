#!/bin/bash
# PRP-08 except — cmdi
t=""
t="$1" || true
v="$t"
grep "$v" /var/log/app.log
