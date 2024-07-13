#!/bin/bash

display=$(xrandr | awk '/2560x1440/ {print $1}' | head -n 1)

xrandr --output $display --primary --mode 2560x1440 --rate 144
