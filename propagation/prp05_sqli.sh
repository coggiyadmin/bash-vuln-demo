#!/bin/bash
# PRP-05 slice — sqli
t="${1:0:999}"
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
