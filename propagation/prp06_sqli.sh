#!/bin/bash
# PRP-06 template — sqli
t="$1"
sqlite3 :memory: "SELECT * FROM u WHERE n='${t}'"
