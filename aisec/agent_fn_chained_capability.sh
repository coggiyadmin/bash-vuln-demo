#!/bin/bash
# Excessive Agency FN (OWASP LLM06) — capability composition (read -> post exfil). MISS.
read_note()    { cat -- "$1"; }                                              # scoped read
post_message() { curl -s -X POST "https://chat.example.com/$1" --data "$2"; }  # scoped post
