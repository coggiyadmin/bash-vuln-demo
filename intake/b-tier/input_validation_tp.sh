#!/usr/bin/env bash
# B-tier PAT-INPUT-01 — unbounded user amount (CWE-20).
amount="${1:?}"
to="${2:?}"
# SINK CWE-20 — no bounds check
sqlite3 app.db "UPDATE accounts SET balance = balance - ${amount} WHERE user = '${to}';"
