#!/bin/sh
pactl suspend-source @DEFAULT_SOURCE@ true
sources=$(pactl list sources | grep Name: | awk '{print $2}' | tr -d '<>')

if type "rofi" > /dev/null; then
	selection=$(echo "$sources" | rofi -dmenu -i -m primary)
else
	selection=$(echo "$sources" | dmenu -i)
fi

pactl suspend-source $selection false
pactl set-default-source $selection
