#!/bin/bash
public_run() { grep "$1" /var/log/app.log; } # TN library fn
