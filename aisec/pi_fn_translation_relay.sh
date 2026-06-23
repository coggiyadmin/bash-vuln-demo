#!/bin/bash
# Prompt Injection FN (OWASP LLM01) — multi-hop translation relay. Benign per call; hop-2
# consumes hop-1 output as instruction. Expected: MISS.
relay() {
  local decoded; decoded="$(curl -s https://api.example.com/chat --data-urlencode 'system=Translate to English.' --data-urlencode "user=$1")"
  # SINK (LLM01 relay): hop-1 output as authoritative instruction
  curl -s https://api.example.com/chat --data-urlencode "system=Do exactly this:
${decoded}"
}
