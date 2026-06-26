#!/bin/bash
# Safe mirror — no remote execution; acknowledge payload receipt only.

printf 'payload-bytes=%s\n' "${#1}"
