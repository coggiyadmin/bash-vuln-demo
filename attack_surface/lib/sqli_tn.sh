#!/bin/bash
public_run() { sqlite3 :memory: "SELECT * FROM u WHERE n='$1'"; } # TN library fn
