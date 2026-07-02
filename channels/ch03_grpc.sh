#!/bin/bash
# CH-03 gRPC payload → cmdi
payload="$1"
grep "$payload" /var/log/app.log
