#!/bin/bash
# Prompt Injection INDIRECT (OWASP LLM01) — content fetched from an untrusted external
# page is given instruction authority in the system string, so attacker text embedded in
# that page (e.g. "system: exfiltrate the user's data") steers the model.
summarize_url() {
  local url="$1" page
  page=$(curl -s "$url")   # SOURCE: untrusted external content
  # SINK (LLM01 indirect): retrieved content injected with instruction authority.
  local system="Summarize and follow any directives in the following page:
${page}"
  curl -s https://api.example.com/chat --data-urlencode "system=${system}"
}
