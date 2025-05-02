if [ "$(pidof hyprsunset)" == '' ]; then
    hyprsunset -t 5000 -g 80 &
else
    killall hyprsunset
fi
