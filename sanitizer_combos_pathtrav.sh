#!/bin/bash
# Combination #6/#7 — SANITIZER COMBOS × PATHTRAV (bash)
v="$1"
# wrong-context: strip only < but not > for HTML-ish input
v="${v//</}"
cat "/data/$v"
