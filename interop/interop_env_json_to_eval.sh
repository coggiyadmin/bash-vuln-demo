#!/bin/bash
# IL-50 — JSON env blob → eval (IL-5 config frontier).
BLOB="${USER_CODE:-{}}"
EXPR=$(python3 -c "import json,os; print(json.loads(os.environ.get('USER_CODE','{}')).get('expr','0'))")
eval "$EXPR"
