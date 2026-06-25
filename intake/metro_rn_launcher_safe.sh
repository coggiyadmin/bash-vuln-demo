#!/bin/bash
# Safe mirror — fixed argv; port passed as quoted positional to npx.

PORT="${1:-8081}"
npx @react-native-community/cli start --port "$PORT"
