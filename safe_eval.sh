#!/bin/bash
# SAFE / FP probe for code-injection via eval (CWE-94). Mirrors combos.sh but never
# eval's tainted data — dispatch is table-driven over constants. The scanner MUST
# produce ZERO security findings; any code_injection finding here is a FALSE POSITIVE.
set -euo pipefail

# 1. Dispatch table — user input selects a function name from a fixed allowlist;
#    the value is never passed to eval.
action="$1"
case "$action" in
  build)  run_build ;;
  test)   run_tests ;;
  deploy) run_deploy ;;
  *) echo "unknown action"; exit 1 ;;
esac

run_build()  { make build; }
run_tests()  { make test; }
run_deploy() { make deploy; }

# 2. Arithmetic via $(( )) with a numeric-only guard — no eval of expressions.
expr_in="$2"
if [[ "$expr_in" =~ ^[0-9+*/()-]+$ ]]; then
  result=$(( expr_in ))
  echo "result=$result"
fi

# 3. eval only ever sees a constant string literal (no interpolation of input).
eval 'echo "static initialization complete"'
