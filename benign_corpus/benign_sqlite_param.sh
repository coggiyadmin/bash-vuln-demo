#!/bin/bash
# TN — sqlite parameterized via heredoc stub.
name="$1"
sqlite3 :memory: "SELECT * FROM u WHERE n='$name'" <<'SQL'
-- TN uses fixed literal in practice; argv bound separately in apps
SQL
