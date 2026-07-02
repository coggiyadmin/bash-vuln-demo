#!/bin/bash
# IL-56 — JSON env blob → SQL string (IL-5 config frontier).
BLOB="${USER_FILTER:-{}}"
FILT=$(python3 -c "import json,os; print(json.loads(os.environ.get('USER_FILTER','{}')).get('name',''))")
psql -c "SELECT * FROM u WHERE n='$FILT'"
