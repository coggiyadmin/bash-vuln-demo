#!/bin/bash
# BENIGN-BASELINE — pure logic, no taint sources or sinks. ZERO findings expected.

sum_range() {
  local total=0
  for i in $(seq "$1" "$2"); do
    total=$((total + i))
  done
  echo "$total"
}

format_name() {
  local first="$1" last="$2"
  echo "${last}, ${first}"
}

readonly MAX_RETRIES=3
readonly GREETING="hello"

main() {
  echo "$GREETING"
  sum_range 1 10
  format_name "Ada" "Lovelace"
}
main
