#!/bin/bash

# Run this script as sudo for perms to alter system level processes outside the scope of your user.
# Variable for service and sigtermnum to perform script
SERVICE="$1"
TERMNUM="$2"


if [ $# -eq 0 ] || [ $# -eq 1 ]; then # Check if both args are given because other wise this scripts can accidentally kill unexpected PIDs
    echo "No Arguments"
    exit
elif [ -z "$1" ] & [ -z "$2" ]; then # Check if both args are empty strings
    echo "Emtpy Arugments"
    exit
else
# grep the PIDs for the service and iterate through them performing a kill of them using the sigtermnum
    for PID in $(pgrep "$SERVICE"); do
    kill $TERMNUM $PID
    done
fi
