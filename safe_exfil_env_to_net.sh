#!/bin/bash
# SAFE mirror — secret used locally to sign; only non-sensitive payload sent.
report_metrics() {
  local payload="$1"
  local api_key="${INTERNAL_API_KEY:?}"
  local sig
  sig=$(printf '%s' "$payload" | openssl dgst -sha256 -hmac "$api_key" | awk '{print $2}')
  curl -sS -X POST "https://api.internal.example.com/metrics" \
    -H "X-Signature: ${sig}" -d "$payload" >/dev/null
}
