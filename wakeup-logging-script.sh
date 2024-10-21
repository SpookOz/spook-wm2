#!/bin/bash

# WM2 Suspend test script v9 - 221024

# Variables
sleeptime=2
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

# Wait a few seconds before checking the lid state
logger "SleepPatch: Waiting $sleeptime seconds to wait for system to wake up."
sleep $sleeptime

# Check the sleep state
logger "SleepPatch: Arguments passed: $1 $2."

# Check battery level
logger "SleepPatch: Battery level: $battery_level%."

# Check if the lid state file exists
if [ ! -f /proc/acpi/button/lid/*/state ]; then
    logger "SleepPatch: Lid state file not found. Exiting script."
    exit 1
fi

# Check the lid state, exit if open
lid_state=$(cat /proc/acpi/button/lid/*/state | awk '{print $2}')
if [ -z "$lid_state" ]; then
    logger "SleepPatch: Unable to determine lid state. Exiting script."
    exit 1
elif [ "$lid_state" = "open" ]; then
    logger "SleepPatch: Lid is open. Finishing script."
    exit 0
else
    logger "SleepPatch: Lid is closed. Finishing script."
    exit 0
fi
