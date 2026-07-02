#!/bin/bash
# SAFE — constant query only.
psql -c "SELECT * FROM u WHERE n='alice'"
