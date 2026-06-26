#!/bin/bash
# PRP-08 except — sqli
t=""
t="$1" || true
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
