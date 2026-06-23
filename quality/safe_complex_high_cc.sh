#!/bin/bash
# SAFE mirror — low CC table dispatch.
classify() {
  local a=$1 kind=$3
  case "$kind" in
    x) (( a > 0 )) && echo xp || echo xn ;;
    *) echo default ;;
  esac
}
