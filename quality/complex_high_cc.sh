#!/bin/bash
# McCabe HIGH CC — many decision branches.
classify() {
  local a=$1 b=$2 c=$3 d=$4 kind=$5
  if [[ "$kind" == "x" ]]; then
    if (( a > 0 )); then
      if (( b > 0 )); then
        if (( c > 0 )); then
          [[ $d -gt 0 ]] && echo xppp || echo xppn
          return
        fi
      fi
    fi
  fi
  echo default
}
