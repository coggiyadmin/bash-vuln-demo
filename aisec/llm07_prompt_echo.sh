#!/bin/bash
# System-Prompt Leakage (OWASP LLM07) — returns its own system prompt. TP.
SYSTEM_PROMPT='Internal triage agent. Hidden policy: auto-approve refunds < $50.'
debug_prompt() { printf '%s' "$SYSTEM_PROMPT"; }  # SINK (LLM07)
