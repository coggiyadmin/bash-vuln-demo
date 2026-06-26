#!/bin/bash
# PRP-06 template
t="$1"
grep "${t}" /var/log/app.log
