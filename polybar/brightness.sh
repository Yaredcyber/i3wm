#!/bin/bash

# Get the current brightness level
CURRENT_BRIGHTNESS=$(xrandr --verbose | grep "Brightness" | awk '{print $2}' | head -n 1)

# Set the increment for brightness adjustment
INCREMENT=0.1

# Check the argument passed to the script
case "$1" in
    up)
        # Increase brightness, cap at 1.0
        NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS + $INCREMENT" | bc)
        if (( $(echo "$NEW_BRIGHTNESS > 1.0" | bc -l) )); then
            NEW_BRIGHTNESS=1.0
        fi
        ;;
    down)
        # Decrease brightness, cap at 0.0
        NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS - $INCREMENT" | bc)
        if (( $(echo "$NEW_BRIGHTNESS < 0.0" | bc -l) )); then
            NEW_BRIGHTNESS=0.0
        fi
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
esac

# Set the new brightness
xrandr --output eDP-1 --brightness "$NEW_BRIGHTNESS"  # Change eDP-1 to your display name if needed

