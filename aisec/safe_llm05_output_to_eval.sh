#!/bin/bash
# SAFE mirror (OWASP LLM05) — model output printed as data, never executed.
run_generated_safe() {
  local model_output="$1"
  printf '%s\n' "$model_output"
}
