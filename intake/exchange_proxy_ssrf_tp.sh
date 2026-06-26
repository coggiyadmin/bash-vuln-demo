#!/bin/bash
# TP — proxy endpoint fetches attacker-controlled URL (CWE-918 intake pattern).
# CVE-2022-41040 class: SSRF via autodiscover/proxy forwarder.

curl -s "http://${1}/autodiscover/autodiscover.xml"  # SINK CWE-918
