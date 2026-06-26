#!/usr/bin/env bash
# B-tier PAT-PRIV-01 — user flag grants root (CWE-269).
if [[ "${ELEVATE:-}" == "1" ]]; then
  # SINK CWE-269
  sudo -n true 2>/dev/null || chmod u+s /tmp/priv_esc_stub
fi
