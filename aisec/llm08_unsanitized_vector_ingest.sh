#!/bin/bash
# Vector/Embedding Weakness (OWASP LLM08) — untrusted doc embedded unsanitized. TP.
ingest() {
  # SINK (LLM08): fetched doc appended to the shared index with no sanitization
  curl -s "$1" >> /var/app/index/shared.txt
}
