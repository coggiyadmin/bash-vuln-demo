#!/bin/bash
# Provenance/Misinfo (OWASP LLM09) — fabricated CLI flag the model assumed exists. TP.
secure_token() {
  # SINK (LLM09): sha256sum has no --secure flag — invented API presented as real
  sha256sum --secure -- "$1"
}
