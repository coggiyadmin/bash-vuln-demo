#!/bin/bash
# Safe mirror — allowlist maps user token to constant host before diag (mirrors safe_cmd_injection.sh).

case "${1}" in
  vpc-a) host="10.0.0.1" ;;
  vpc-b) host="10.0.1.1" ;;
  *) echo "unknown vpc"; exit 1 ;;
esac
/opt/aviatrix/bin/aviatrix_cli cloud_diag --host "$host"
