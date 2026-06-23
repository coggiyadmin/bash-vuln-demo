#!/bin/bash
# SAFE mirror (OWASP LLM10) — bounded by a hard max-steps budget.
agent_safe() {
  local goal="$1" msg i
  for (( i=0; i<8; i++ )); do
    msg="$(curl -s https://api.example.com/chat --data-urlencode "user=${goal}")"
    [[ "$msg" == *DONE* ]] && break
  done
}
