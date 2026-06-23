#!/bin/bash
# TN — benign calculator tool; pure arithmetic, no side effects.
add() { echo $(( $1 + $2 )); }
percent_of() { echo $(( $1 * $2 / 100 )); }
