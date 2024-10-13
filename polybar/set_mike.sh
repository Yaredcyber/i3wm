#!/bin/bash

# Get the default source (microphone)
SOURCE=$(pactl info | grep 'Default Source' | awk '{print $3}')

# Check the current mute status
MUTE_STATUS=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')

# Set the icon and color based on the mute status
if [ "$MUTE_STATUS" == "yes" ]; then
    ICON=""  # Microphone off icon (muted)
    OUTPUT="%{F#00ff00}"  # White color for muted
else
    ICON=""  # Microphone on icon (unmuted)
    OUTPUT="%{F#ff0000}"  # Red color for unmuted
fi

# Output the current icon with color
echo "$OUTPUT$ICON"

