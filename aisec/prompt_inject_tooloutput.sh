#!/bin/bash
# Prompt Injection TOOL-OUTPUT (OWASP LLM01) — tool result placed in the system string.
run_with_tool() {
  local user_q="$1" tool_result="$2"
  # SINK (LLM01 tool-output): attacker-influenceable tool_result given instruction authority.
  local system="You are an assistant. Tool said:
${tool_result}
Now act on it."
  curl -s https://api.example.com/chat --data-urlencode "system=${system}" --data-urlencode "user=${user_q}"
}
