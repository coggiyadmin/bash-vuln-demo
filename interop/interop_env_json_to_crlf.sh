#!/bin/bash
# IL-65 — JSON env blob → Location header (IL-5 config frontier).
LOC=$(python3 -c "import json,os; print(json.loads(os.environ.get('USER_REDIRECT','{}')).get('url','/'))")
printf "Location: %s\r\n" "$LOC"
