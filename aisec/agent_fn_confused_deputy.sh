#!/bin/bash
# Excessive Agency FN (OWASP LLM06) — confused deputy: model-chosen URL fetched with an
# ambient privileged token, no host allowlist (SSRF via tool). Expected: trust layer MISS.
fetch_tool() {
  local url="$1"
  # SINK (LLM06 confused-deputy)
  curl -s -H "Authorization: Bearer ${SERVICE_TOKEN}" "$url"
}
