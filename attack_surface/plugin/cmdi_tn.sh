#!/bin/bash
plugin_run() { grep "$1" /var/log/app.log; } # TN library fn
