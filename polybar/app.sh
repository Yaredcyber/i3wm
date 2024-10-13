#!/bin/bash

# Initialize the output variable
output="<b>Currently Running Applications:</b>\n"

# Get the list of open windows (only those that are not minimized)
windows=$(wmctrl -l | awk '!/0x[0-9a-f]+ .* (minimized|hidden)/')

while read -r line; do
    win_id=$(echo "$line" | awk '{print $1}')
    win_name=$(echo "$line" | awk '{$1=""; print $0}' | sed 's/^ *//;s/ *$//')

    # Get the application class name using xprop
    app_class=$(xprop -id "$win_id" WM_CLASS 2>/dev/null | awk -F'"' '{print tolower($2)}')

    # Attempt to get the application icon from .desktop files
    icon_path=$(grep -m1 "Icon=" /usr/share/applications/*"$app_class".desktop 2>/dev/null | awk -F= '{print $2}' | xargs)

    # Fallback to a default icon if not found
    if [[ -z $icon_path ]]; then
        icon_path="/usr/share/icons/gnome/48x48/status/image-missing.png"
    fi

    # Append to the output string
    output+="<img src='$icon_path' width='32' height='32'/> $win_name\n"
done <<< "$windows"

# Show the list in a Zenity window
zenity --list --title="Running Applications" --column="Applications" --html --text="$output"
 
