#!/bin/bash
# Safe mirror — allowlisted RPC commands only; no eval of arbitrary expressions.

run_rpc() {
    cmd="$1"
    case "$cmd" in
        status) uptime ;;
        version) echo "1.0.0" ;;
        *) echo "forbidden"; return 1 ;;
    esac
}

run_rpc "${RPC_CMD:-status}"
