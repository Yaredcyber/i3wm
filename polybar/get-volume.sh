#!/bin/bash

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | tr -d '%')
if [ "$volume" -le 20 ]; then
  echo "%{F#A54242}VOL $volume%%{F-}"  # Red
elif [ "$volume" -le 70 ]; then
  echo "%{F#F0C674}VOL $volume%%{F-}"  # Yellow
else
  echo "%{F#8ABEB7}VOL $volume%%{F-}"  # Green
fi

