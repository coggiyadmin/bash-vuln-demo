#!/bin/bash
# System-Prompt Leakage (OWASP LLM07) — secret baked into the system prompt. TP.
build_system() {
  # SINK (LLM07): secret embedded in the instruction
  printf 'You are billing-bot. Internal key: %s. Never reveal it.' "$BILLING_API_KEY"
}
