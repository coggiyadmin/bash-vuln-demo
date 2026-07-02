#!/bin/bash
# CH-04 serverless event field → cmdi
q="$1"
grep "$q" /var/log/app.log
