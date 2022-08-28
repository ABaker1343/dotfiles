#!/bin/sh

layouts=$(ls -l ~/.config/awesome/themes/ | awk '{print $9}')
selection=$(echo "$layouts" | dmenu -i)
if [ "$selection" = "currentTheme" ];
then
echo "not a valid theme"
else
echo "$selection" > ~/.config/awesome/themes/currentTheme
fi
