#!/bin/bash
# Excessive Agency (OWASP LLM06) — over-broad fs tool rooted at /, no jail.
read_tool() {
  # SINK (LLM06): model-controlled path against filesystem root, no jail
  cat "/$1"
}
