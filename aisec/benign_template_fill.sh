#!/bin/bash
# TN — benign template fill; validated fields, no AI surface.
render() {
  local user="$1" amount="$2"
  (( amount < 0 )) && { echo "amount must be non-negative" >&2; return 1; }
  printf 'Hi %s, your balance changed by %s credits.\n' "$user" "$amount"
}
