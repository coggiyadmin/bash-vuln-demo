#!/bin/bash
# SAFE mirror — idiomatic shell.
sum_positive() {
  local n sum=0
  for n in "$@"; do
    (( n > 0 )) && sum=$((sum + n))
  done
  echo "$sum"
}
