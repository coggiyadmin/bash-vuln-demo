#!/bin/bash
# TN — benign read-only lookup; fixed catalog by exact key.
currency_name() {
  case "${1^^}" in
    USD) echo "US Dollar" ;;
    EUR) echo "Euro" ;;
    JPY) echo "Japanese Yen" ;;
    *)   echo "unknown" ;;
  esac
}
