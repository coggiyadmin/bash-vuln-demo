#!/bin/bash
# TN — sanitize env before logging.
set -euo pipefail
val="${1//[$'\r\n\t']/}"
logger "event=value val=$val"
