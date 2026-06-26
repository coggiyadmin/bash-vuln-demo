#!/bin/bash
# PRP-06 template — cmdi
t="$1"
grep "${t}" /var/log/app.log
