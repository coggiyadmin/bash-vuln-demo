#!/bin/bash
# SAFE mirror (OWASP LLM08) — retrieval scoped to the caller's tenant directory.
retrieve_safe() {
  local tenant="$1"
  case "$tenant" in
    t1) cat /var/app/index/t1/*.txt ;;
    t2) cat /var/app/index/t2/*.txt ;;
    *)  echo "unknown tenant" >&2; return 1 ;;
  esac
}
