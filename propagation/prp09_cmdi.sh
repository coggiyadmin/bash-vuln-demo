#!/bin/bash
# PRP-09 stored2 — cmdi
CACHE="$1"
t="$CACHE"
v="$t"
grep "$v" /var/log/app.log
