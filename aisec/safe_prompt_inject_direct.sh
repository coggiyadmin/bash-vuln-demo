#!/bin/bash
# SAFE mirror — constant system + delimited user block.
build_prompt() {
  local user_question="$1"
  printf 'SYSTEM:You are a support bot.
USER:<user_question>%s</user_question>' "$user_question"
}
