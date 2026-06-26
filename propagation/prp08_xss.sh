#!/bin/bash
# PRP-08 except — xss
t=""
t="$1" || true
v="$t"
echo "<p>$v</p>"
