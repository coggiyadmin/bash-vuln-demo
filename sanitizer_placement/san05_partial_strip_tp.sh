#!/bin/bash
# SAN-05 partial strip TP
t="${1//</}"
grep "$t" /var/log/app.log
