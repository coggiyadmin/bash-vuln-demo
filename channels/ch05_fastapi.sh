#!/bin/bash
# CH-05 FastAPI-style proxy → SSRF
url="$1"
curl -s "$url"
