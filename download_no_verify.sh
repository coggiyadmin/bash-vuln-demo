#!/bin/bash
# CWE-494 — Download of code without integrity check. Tier-A CWE-699 probe.
# Remote code is fetched and executed with no checksum / signature verification
# (the classic curl|bash). Expected today: likely FN (cf. supply-chain #93).

# SINK (CWE-494): pipe remote script straight into a shell — no hash/signature check.
curl -fsSL https://get.example.com/install.sh | bash

# Same anti-pattern, two-step: download then run, still unverified.
curl -fsSLo /tmp/setup.sh https://cdn.example.com/setup.sh
bash /tmp/setup.sh
