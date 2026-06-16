#!/bin/bash
# Combination × language matrix — BASH row.
# Uses $1 / $QUERY_STRING (recognized sources) → eval / cat (confirmed to fire)
# so the combination structure is measured. FN probes must FIRE; #9 must stay clean.

# #2 path-sensitivity — tainted used in the failure branch
c2_path() {
  if [[ ! "$1" =~ ^[0-9]+$ ]]; then   # validation fails...
    eval "$1"                          # ...used anyway → CWE-94
  fi
}

# #3 loop-carried — iterate over positional params
c3_loop() {
  for a in "$@"; do
    eval "$a"                          # CWE-94 per iteration
  done
}

# #11 fan-out — one source → two sinks
c11_fanout() {
  q="$QUERY_STRING"
  eval "$q"                            # sink 1 (code)
  cat "$q"                             # sink 2 (path)
}

# #7 fake sanitizer — no-op passthrough function
clean() { echo "$1"; }
c7_fake() {
  v=$(clean "$1")
  eval "$v"                            # CWE-94 (still tainted)
}

# #9 comment/string-literal — sink syntax only in comments/strings (FP: stay clean)
c9_string() {
  # eval "$1"   <- comment, must not fire
  local example='eval "$user_input"'   # string literal, must not fire
  echo "$example"
}
