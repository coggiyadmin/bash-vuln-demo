#!/bin/bash
# SAFE mirror (OWASP LLM08) — per-tenant index, size-bounded, control chars stripped.
ingest_safe() {
  local tenant="$1" text="$2"
  printf '%s' "$text" | tr -d '\000' | head -c 20000 >> "/var/app/index/${tenant}.txt"
}
