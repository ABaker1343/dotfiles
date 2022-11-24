#!/bin/sh
pactl suspend-sink @DEFAULT_SINK@ true
sinks=$(pactl list sinks | grep Name: | awk '{print $2}' | tr -d '<>')

selection=$(echo "$sinks" | dmenu -i)

pactl suspend-sink $selection false
pactl set-default-sink $selection
