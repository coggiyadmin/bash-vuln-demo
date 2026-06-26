#!/bin/bash
q="${TARGET:-}" # SOURCE SRC-07
grep "$q" /var/log/app.log
