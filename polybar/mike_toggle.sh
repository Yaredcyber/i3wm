#!/bin/bash

# Get the default source (microphone)
SOURCE=$(pactl info | grep 'Default Source' | awk '{print $3}')

# Check the current mute status
MUTE_STATUS=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')

# Toggle mute status
if [ "$MUTE_STATUS" == "yes" ]; then
    pactl set-source-mute "$SOURCE" 0  # Unmute
else
    pactl set-source-mute "$SOURCE" 1  # Mute
fi

