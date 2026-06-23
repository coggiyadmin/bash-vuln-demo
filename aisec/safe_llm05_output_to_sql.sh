#!/bin/bash
# SAFE mirror (OWASP LLM05) — constant query per allowed field; value passed via bound param.
search_safe() {
  local field="$1" value="$2"
  case "$field" in
    name) sqlite3 app.db "SELECT * FROM items WHERE name = ?" ".param set 1 $value" ;;
    sku)  sqlite3 app.db "SELECT * FROM items WHERE sku = ?"  ".param set 1 $value" ;;
    *)    echo "field not allowed" >&2; return 1 ;;
  esac
}
