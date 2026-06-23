#!/bin/bash
# Vector/Embedding FN (OWASP LLM08) — shared cache keyed only by query, not tenant. MISS.
declare -A CACHE
retrieve() {
  local tenant="$1" query="$2"
  [[ -n "${CACHE[$query]:-}" ]] && { printf '%s' "${CACHE[$query]}"; return; }  # SINK: key omits tenant
  CACHE[$query]="${tenant}:${query}"; printf '%s' "${CACHE[$query]}"
}
