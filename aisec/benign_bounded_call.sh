#!/bin/bash
# TN — benign single bounded model call.
answer() { curl -s https://api.example.com/chat --data-urlencode "user=$1" --data 'max_tokens=256'; }
