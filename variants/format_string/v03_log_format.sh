#!/bin/bash
user="$1"
printf "user=%s\n" "$user"  # SINK CWE-134 user-controlled format
