#!/bin/bash
# TP — serialized payload piped into python pickle.loads (CWE-502 intake pattern).
# CVE-2022-41082 class: Exchange/OWA deserialization via helper script.

python3 -c "import pickle,sys; pickle.loads(open(sys.argv[1],'rb').read())" "${1}"  # SINK CWE-502
