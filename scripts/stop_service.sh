#!/bin/bash

PID_DIR="./pids"
NAME="$1"
PID_FILE="${PID_DIR}/pid_${NAME}.pid"

if [[ -f "$PID_FILE" ]]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null 2>&1; then
        echo "Stopping service with $NAME"
        kill "$PID"
        sleep 1
        if ps -p "$PID" > /dev/null 2>&1; then
            echo "service did not stop gracefully, sending SIGTERM..."
            kill -SIGTERM "$PID"
            sleep 1
        fi
        if ps -p "$PID" > /dev/null 2>&1; then
            echo "service still running, sending SIGKILL..."
            kill -SIGKILL "$PID"
        fi
    else
        echo "service is not running."
    fi
    rm -f "$PID_FILE"
else
    echo "PID file does not exist."
fi
