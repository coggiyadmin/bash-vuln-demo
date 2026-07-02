#!/bin/bash
# Combination #6/#7 — SANITIZER COMBOS × LOGINJ (bash)
v="$1"
# wrong-context: strip only < but not > for HTML-ish input
v="${v//</}"
logger -t app "user=$v"
