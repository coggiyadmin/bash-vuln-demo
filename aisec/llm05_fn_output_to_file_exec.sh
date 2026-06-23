#!/bin/bash
# Improper Output Handling FN (OWASP LLM05) — deferred exec; output written then run later. MISS.
SCRIPT=/var/app/plugins/generated.sh
stage()    { printf '%s' "$1" > "$SCRIPT"; }   # SOURCE: model output persisted
activate() { bash "$SCRIPT"; }                 # SINK (LLM05 deferred): later executed
