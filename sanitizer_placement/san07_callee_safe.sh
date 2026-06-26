#!/bin/bash
sink() { grep -- "$1" /var/log/app.log; }
sink "$1"
