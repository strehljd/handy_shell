#!/bin/bash

# Server IP address and port
SERVER_IP="vordat.de"
SERVER_PORT=$1

# Message to send
MESSAGE="Kölle Alaaf!"

# Interval in milliseconds (1000 ms = 1 second)
INTERVAL_MS=$2

# Convert milliseconds to seconds for the sleep command
INTERVAL_SEC=$(echo "scale=3; $INTERVAL_MS/1000" | bc)

# Start a persistent connection and send messages at the specified interval
{
    while true; do
        echo "$MESSAGE"
        sleep "$INTERVAL_SEC"
    done
} | nc "$SERVER_IP" "$SERVER_PORT"
