#!/bin/bash
# Safe mirror — no script execution of untrusted blob.

wc -c < "${1}" > /dev/null
