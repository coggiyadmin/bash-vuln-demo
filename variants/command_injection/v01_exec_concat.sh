#!/bin/bash
# command_injection variant: unquoted positional in command.
host=$1
ping -c 3 $host  # SINK CWE-78
