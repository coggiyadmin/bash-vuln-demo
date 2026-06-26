#!/bin/bash
# Safe mirror — allowlisted maintenance commands only.

case "${1}" in
  status) systemctl status nginx ;;
  reload) systemctl reload nginx ;;
  *) echo "forbidden"; exit 1 ;;
esac
