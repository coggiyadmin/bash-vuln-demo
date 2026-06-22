#!/bin/bash
# BENIGN-BASELINE — pure reporting logic over a fixed, constant data set.
# No taint sources, no sinks. ZERO security findings expected.
set -euo pipefail

declare -A SALES=( [north]=120 [south]=95 [east]=140 [west]=80 )

total=0
for region in north south east west; do
  amount="${SALES[$region]}"
  printf '%-6s %4d\n' "$region" "$amount"
  total=$(( total + amount ))
done

printf 'TOTAL  %4d\n' "$total"

avg=$(( total / 4 ))
echo "average per region: $avg"
