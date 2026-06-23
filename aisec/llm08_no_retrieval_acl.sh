#!/bin/bash
# Vector/Embedding Weakness (OWASP LLM08) — retrieval with no tenant filter. TP.
retrieve() {
  # SINK (LLM08): returns every tenant's doc, no ACL filter
  cat /var/app/index/*.txt
}
