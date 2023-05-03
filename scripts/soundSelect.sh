#!/bin/sh
pactl suspend-sink @DEFAULT_SINK@ true
sinks=$(pactl list sinks | grep Name: | awk '{print $2}' | tr -d '<>')

if type "rofi" > /dev/null; then
	selection=$(echo "$sinks" | rofi -dmenu -i)
else
	selection=$(echo "$sinks" | dmenu -i)
fi

pactl suspend-sink $selection false
pactl set-default-sink $selection
