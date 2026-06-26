#!/bin/bash
# TP — untrusted serialized blob passed to node deserialize (CWE-502 intake pattern).
# CVE-2023-46604 class: message broker openwire/deserialization RCE chain (bash launcher).

node -e 'require("node-serialize").unserialize(process.argv[1])' "${1}"  # SINK CWE-502
