#!/bin/bash
# PRP-04 field via nameref stub — sqli
t="$1"
v="$t"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
