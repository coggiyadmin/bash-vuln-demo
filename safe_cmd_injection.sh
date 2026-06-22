#!/bin/bash
# SAFE / FP probe for command-injection (CWE-78). Mirrors deploy.sh / server-admin.sh
# sinks but neutralizes the taint by mapping user input to constants before it reaches
# any command. The scanner MUST produce ZERO security findings; any command_injection
# finding here is a FALSE POSITIVE.
set -euo pipefail

# 1. Allowlist → constant: user input selects a branch; the value that reaches ssh is
#    a hard-coded literal host, never the tainted variable.
case "$1" in
  prod)    host="prod.internal.example.com" ;;
  staging) host="staging.internal.example.com" ;;
  qa)      host="qa.internal.example.com" ;;
  *) echo "unknown host"; exit 1 ;;
esac
ssh "root@${host}" -- 'cd /app && git pull'

# 2. Allowlist → constant for the package name too; the sink sees only literals.
case "$2" in
  nginx)  pkg="nginx" ;;
  redis)  pkg="redis-server" ;;
  *) echo "unknown package"; exit 1 ;;
esac
apt-get install -y -- "$pkg"

# 3. Quoted constant command — no user data reaches the invocation at all.
systemctl restart -- "nginx.service"
