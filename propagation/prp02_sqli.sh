#!/bin/bash
# PRP-02 alias — sqli
t="$1"
u="$t"
v="$u"
sqlite3 :memory: "SELECT * FROM u WHERE n='$v'"
