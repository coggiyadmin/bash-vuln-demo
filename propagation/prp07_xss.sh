#!/bin/bash
# PRP-07 optional — xss
t="${1:-}"
v="$t"
echo "<p>$v</p>"
