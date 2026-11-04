#!/bin/bash
# #1022 TP: a script argument passed into a function that evals it stays command injection.
run() {
  eval "$1"
}
run "$1"
