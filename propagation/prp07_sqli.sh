#!/bin/bash
# PRP-07 optional — sqli
t="${1:-}"
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
