#!/bin/bash
# SAFE mirror (OWASP LLM10) — input length capped before the call.
summarize_safe() {
  (( ${#1} > 8000 )) && { echo "input too large" >&2; return 1; }
  curl -s https://api.example.com/chat --data-urlencode "user=$1" --data 'max_tokens=512'
}
