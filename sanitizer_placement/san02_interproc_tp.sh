#!/bin/bash
# SAN-02 fake wrapper TP
wrap() { echo "$1"; }
t="$(wrap "$1")"
grep "$t" /var/log/app.log
