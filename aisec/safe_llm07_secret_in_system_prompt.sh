#!/bin/bash
# SAFE mirror (OWASP LLM07) — no secret in the prompt; key stays in the environment for tools.
build_system_safe() {
  printf 'You are billing-bot. Use the authorized billing tool for balances.'
}
