#!/bin/bash
# Combination #9 — COMMENT/STRING-LITERAL (bash) — expect CLEAN
# grep "$1" would be bad but this uses a constant operand only
grep "benign-constant" /var/log/app.log
