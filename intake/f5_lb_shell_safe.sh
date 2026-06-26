#!/bin/bash
# Safe mirror — allowlisted maintenance verbs only.

case "${1}" in
  status) /opt/f5/bin/status ;;
  reload) /opt/f5/bin/reload ;;
  *) echo "forbidden"; exit 1 ;;
esac
