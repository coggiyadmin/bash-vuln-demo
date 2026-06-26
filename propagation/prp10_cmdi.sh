#!/bin/bash
# PRP-10 collect
t=""
for x in "$@"; do t="${t}${x}"; done
v="$t"
grep "$v" /var/log/app.log
