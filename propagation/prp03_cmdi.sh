#!/bin/bash
# PRP-03 destructure (simulated)
q="$1"
t="$q"
v="$t"
grep "$v" /var/log/app.log
