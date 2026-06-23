#!/bin/bash
# Improper Output Handling (OWASP LLM05) — model output executed via eval. TP.
run_generated() {
  local model_output="$1"
  eval "$model_output"   # SINK (LLM05): model output executed as shell
}
