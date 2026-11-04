#!/bin/bash
# #1022 safe: a script argument must not reach "$2" inside an unrelated helper.
BASELINE=""
while [ $# -gt 0 ]; do
  case "$1" in
    --baseline) BASELINE="${2:-}"; shift 2 ;;
  esac
done
summarise() {
  grep -cE 'error TS' "$2" ./tsc.log
}
record() { NAMES+=("$1"); RESULTS+=("$2"); }
summarise tsc ./tsc.log
record "install" "ok"
