#!/usr/bin/env bash
# Safe mirror — PAT-INPUT-01
amount="${1:?}"
to="${2:?}"
max=1000
if ! [[ "$amount" =~ ^[0-9]+$ ]] || (( amount <= 0 || amount > max )); then
  echo "bad amount" >&2
  exit 1
fi
sqlite3 app.db "UPDATE accounts SET balance = balance - ${amount} WHERE user = '${to}';"
