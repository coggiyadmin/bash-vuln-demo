#!/bin/bash
# PRP-10 collect — sqli
t=""
for x in "$@"; do t="${t}${x}"; done
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
