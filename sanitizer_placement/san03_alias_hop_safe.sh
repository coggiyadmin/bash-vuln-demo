#!/bin/bash
t="$1"
u="$t"
grep -- "$u" /var/log/app.log
