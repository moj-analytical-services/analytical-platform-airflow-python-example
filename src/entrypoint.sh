#!/usr/bin/env bash

MODE="${MODE:-basic}"

case "${MODE}" in
  basic)
    echo "Running in basic mode"
    env
    aws sts get-caller-identity
    ;;
  benchmark)
    echo "Running in benchmark mode"
    env
    aws sts get-caller-identity
    python3 main.py
    ;;
  *)
    echo "Unknown mode: ${MODE}"
    exit 1
    ;;
esac