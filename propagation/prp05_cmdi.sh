#!/bin/bash
# PRP-05 slice
t="${1:0:999}"
v="$t"
grep "$v" /var/log/app.log
