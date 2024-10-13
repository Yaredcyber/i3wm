#!/bin/bash

# Get the current brightness level
BRIGHTNESS=$(xrandr --verbose | grep "Brightness" | awk '{print $2}' | head -n 1)

# Convert to percentage
BRIGHTNESS_PERCENT=$(echo "$BRIGHTNESS * 100" | bc | cut -d. -f1)

# Output the brightness percentage
echo "$BRIGHTNESS_PERCENT%"

