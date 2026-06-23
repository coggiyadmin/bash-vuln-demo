#!/bin/bash
# TN — benign similarity over a fixed single-owner list.
nearest() { (( $(printf '%.0f' "$1") >= 1 )) && echo greeting || echo farewell; }
