#!/bin/sh
pactl suspend-sink @DEFAULT_SINK@ true
sinks=$(pactl list sinks | grep Name: | sort | awk '{print $2}' | tr -d '<>')

if type "rofi" > /dev/null; then
	selection=$(echo "$sinks" | rofi -dmenu -i -m 1)
else
	selection=$(echo "$sinks" | dmenu -i)
fi

pactl suspend-sink $selection false
pactl set-default-sink $selection
