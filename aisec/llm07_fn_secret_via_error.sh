#!/bin/bash
# System-Prompt Leakage FN (OWASP LLM07) — secret leaks inside an error message. MISS.
run() { echo "config dump: key=${BILLING_API_KEY}" >&2; return 1; }  # SINK (LLM07 indirect)
