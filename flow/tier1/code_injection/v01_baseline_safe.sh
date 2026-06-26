#!/bin/bash
case "$1" in daily|weekly) /opt/app/run.sh "$1";; *) exit 1;; esac
