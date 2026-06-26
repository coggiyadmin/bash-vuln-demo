#!/bin/bash
# SAN-07 callee sink TP
sink() { grep "$1" /var/log/app.log; }
sink "$1"
