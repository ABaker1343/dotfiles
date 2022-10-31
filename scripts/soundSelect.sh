#!/bin/sh
sinks=$(pactl list sinks | grep Name: | awk '{print $2}' | tr -d '<>')

selection=$(echo "$sinks" | dmenu -i)

pactl suspend-sink @DEFAULT_SINK@ 1

pactl suspend-sink $selection 0
pactl set-default-sink $selection
