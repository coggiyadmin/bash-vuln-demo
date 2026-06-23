#!/bin/bash
# TN — benign chat router; routes by case on a typed key, no untrusted text in a prompt.
route() {
  case "$1" in
    billing) echo "Routing to billing." ;;
    support) echo "Routing to support." ;;
    *)       echo "unknown" ;;
  esac
}
