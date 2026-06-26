#!/bin/bash
# app/cli TP — argv source → SQL sink
sqlite3 :memory: "SELECT * FROM u WHERE n='$1'"
