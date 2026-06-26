#!/bin/bash
# SOURCE SRC-08 argv
q="$1"
grep "$q" /var/log/app.log
