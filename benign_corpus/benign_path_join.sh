#!/bin/bash
# TN — join under fixed root.
ROOT="/data"
name="$1"
full="${ROOT}/${name}"
real="$(cd "$(dirname "$full")" && pwd)/$(basename "$full")"
case "$real" in ${ROOT}/*) cat "$real" ;; *) exit 1 ;; esac
