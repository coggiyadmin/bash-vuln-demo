#!/bin/bash
# PRP-05 slice — xss
t="${1:0:999}"
v="$t"
echo "<p>$v</p>"
