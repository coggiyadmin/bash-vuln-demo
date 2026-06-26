#!/bin/bash
# PRP-03 destructure (simulated) — sqli
q="$1"
t="$q"
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
