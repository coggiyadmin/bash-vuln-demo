#!/bin/bash
# TP — web panel passes user host to ping unquoted (CWE-78 intake pattern).
# CVE-2022-44877 class: CWP panel OS command injection via diagnostic parameter.

ping -c 3 $1  # SINK CWE-78
