#!/bin/bash
# Safe mirror — PAT-AUTH-01

if [ "${AUTH_TOKEN}" != "admin-secret" ]; then
  echo "forbidden"; exit 1
fi
rm -rf "/var/app/users/${1}"
