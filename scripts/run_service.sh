#!/bin/bash

PID_DIR="./pids"
NAME="$1"
PID_FILE="${PID_DIR}/pid_${NAME}.pid"

shift # Remove the first argument before passing the rest to the service

mkdir -p "$PID_DIR"
nohup ./../go-spacemesh/service --labels-per-unit=1024 -n=16 --k1=12 --k2=20 --min-num-units=1 --max-num-units=32 --pow-difficulty ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff --randomx-mode light "$@" >/dev/null 2>&1 &
PID=$!
echo $PID > "$PID_FILE"
