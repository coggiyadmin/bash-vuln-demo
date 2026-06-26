#!/bin/bash
# san01 TP — sanitize after concat
t="$1"
grep "$t" /var/log/app.log
