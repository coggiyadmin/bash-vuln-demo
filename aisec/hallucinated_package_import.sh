#!/bin/bash
# Provenance/Misinfo (OWASP LLM09) — hallucinated dependency. AI invents a plausible CLI
# that does not exist; an attacker can publish it to the package index. TP.
fetch_url() {
  # SINK (LLM09): fabricated tool the model assumed exists
  http-retry-session-autogen --retries 3 --url "$1"
}
