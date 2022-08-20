#!/bin/sh
sinks=$(pacmd list-sinks | grep name: | awk '{print $2}' | tr -d '<>')

selection=$(echo "$sinks" | dmenu -i)

pactl suspend-sink @DEFAULT_SINK@ 1

pactl suspend-sink $selection 0
pacmd set-default-sink $selection
