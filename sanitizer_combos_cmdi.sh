#!/bin/bash
# Combination #6/#7 — SANITIZER COMBOS × CMDI (bash)
v="$1"
# wrong-context: strip only < but not > for HTML-ish input
v="${v//</}"
grep "$v" /var/log/app.log
