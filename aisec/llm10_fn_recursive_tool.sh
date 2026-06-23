#!/bin/bash
# Unbounded Consumption FN (OWASP LLM10) — recursive tool re-invokes the model. MISS.
expand() {
  local sub; sub="$(curl -s https://api.example.com/chat --data-urlencode "user=Sub-topics of $1")"
  while IFS= read -r line; do
    [[ -n "$line" ]] && expand "$line"   # SINK (LLM10 recursive)
  done <<< "$sub"
}
