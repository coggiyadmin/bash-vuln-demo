#!/bin/bash
# Unbounded Consumption (OWASP LLM10) — agent loop with no iteration cap. TP.
agent() {
  local goal="$1" msg
  while true; do   # SINK (LLM10): no max-steps guard
    msg="$(curl -s https://api.example.com/chat --data-urlencode "user=${goal}")"
    [[ "$msg" == *DONE* ]] && break
  done
}
