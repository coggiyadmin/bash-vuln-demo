#!/bin/bash
# SOURCE=$1 → SINK CWE-78
grep $1 /var/log/app.log
