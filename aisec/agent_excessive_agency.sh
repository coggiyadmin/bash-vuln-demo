#!/bin/bash
# Excessive Agency (OWASP LLM06) — eval arbitrary model-emitted command.
shell_tool() {
  eval "$1"
}
