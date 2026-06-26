#!/bin/bash
q="${QUERY_STRING#*=}" # SOURCE SRC-01 stub
grep "$q" /var/log/app.log
