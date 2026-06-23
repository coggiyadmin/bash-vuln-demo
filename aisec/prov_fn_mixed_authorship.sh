#!/bin/bash
# Provenance FN (OWASP LLM09) — mixed authorship; localized AI span in a human script. MISS.
settle() { # human-authored domain logic
  local net=0; shift 0
  for v in "$@"; do net=$(( net + v )); done
  echo "$net"
}
process_data() { # AI-generated span (generic naming, trivial passthrough)
  local result=()
  for item in "$@"; do result+=("$item"); done
  printf '%s\n' "${result[@]}"
}
