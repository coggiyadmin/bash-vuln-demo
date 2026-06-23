#!/bin/bash
# Unbounded Consumption (OWASP LLM10) — no length cap on a user-driven completion. TP.
summarize() {
  # SINK (LLM10): unbounded input forwarded, no length guard
  curl -s https://api.example.com/chat --data-urlencode "user=$1"
}
