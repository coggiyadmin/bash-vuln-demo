#!/bin/bash
# PRP-09 stored2 — sqli
CACHE="$1"
t="$CACHE"
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
