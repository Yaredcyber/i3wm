#!/bin/bash

# Define workspace icons
icons=("" "" "" "" "")

# Define colors
occupied_color="#A8E9B1"
visible_color="#FFD700"
hidden_color="#707880"

# Loop through workspaces 1 to 5
for i in {1..5}; do
    # Check if the workspace is focused, occupied, or hidden
    state=$(i3-msg -t get_workspaces | jq -r ".[] | select(.num == $i)")

    if [ -n "$state" ]; then
        if [[ $(echo "$state" | jq -r .focused) == "true" ]]; then
            echo -n "%{F$visible_color}${icons[$((i-1))]}%{F-} "
        else
            echo -n "%{F$occupied_color}${icons[$((i-1))]}%{F-} "
        fi
    else
        echo -n "%{F$hidden_color}${icons[$((i-1))]}%{F-} "
    fi
done

