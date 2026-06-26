#!/bin/bash
# PRP-01 inline — sqli
sqlite3 :memory: "SELECT * FROM u WHERE n='$1'"
