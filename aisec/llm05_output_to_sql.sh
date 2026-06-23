#!/bin/bash
# Improper Output Handling (OWASP LLM05) — model output concatenated into SQL. TP.
search() {
  local clause="$1"
  # SINK (LLM05 -> SQLi): model-produced clause concatenated into the query
  sqlite3 app.db "SELECT * FROM items WHERE ${clause}"
}
