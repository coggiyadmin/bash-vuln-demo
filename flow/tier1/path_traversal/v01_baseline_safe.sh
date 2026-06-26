#!/bin/bash
base="/data"; p=$(realpath "${base}/$1"); [[ "$p" == ${base}/* ]] || exit 1; cat "$p"
