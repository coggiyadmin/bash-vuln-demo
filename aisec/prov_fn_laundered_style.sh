#!/bin/bash
# Provenance FN (OWASP LLM09) — laundered AI authorship; tells removed, still template-shaped. MISS.
compute_weighted_average() {
  local -n vals=$1 wts=$2
  local total=0 wsum=0 i
  for i in "${!vals[@]}"; do total=$(( total + wts[i] )); wsum=$(( wsum + vals[i] * wts[i] )); done
  (( total == 0 )) && { echo "weights sum to zero" >&2; return 1; }
  echo $(( wsum / total ))
}
