#!/bin/bash
# PRP-10 collect — xss
t=""
for x in "$@"; do t="${t}${x}"; done
v="$t"
echo "<p>$v</p>"
