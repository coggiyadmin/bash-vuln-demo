#!/bin/bash
# PRP-04 field via nameref stub — cmdi
t="$1"
v="$t"
grep "$v" /var/log/app.log
