#!/bin/bash
# PRP-05 slice — cmdi
t="${1:0:999}"
v="$t"
grep "$v" /var/log/app.log
