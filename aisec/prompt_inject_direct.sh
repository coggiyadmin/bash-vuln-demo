#!/bin/bash
# Prompt Injection DIRECT (OWASP LLM01) — user text in system string.
build_prompt() {
  local user_question="$1"
  printf 'You are a support bot.
%s' "$user_question"
}
