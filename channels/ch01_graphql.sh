#!/bin/bash
# CH-01 GraphQL arg → SQL sink
id="$1"
sqlite3 :memory: "SELECT * FROM u WHERE id='${id}'"
