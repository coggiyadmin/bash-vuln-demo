#!/bin/bash
user=$1; pw=$2
echo "login user=$user password=$pw" >> /var/log/app.log  # SINK CWE-117
