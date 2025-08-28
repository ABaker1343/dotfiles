#if [ "$(pidof hyprsunset)" == '' ]; then
    #hyprsunset -t 5000 -g 80 &
#else
    #killall hyprsunset
#fi

filter_start=$(date -d '20:00' +'%s')
filter_end=$(date -d '06:00' +'%s')

while [ true ]; do
    current_time=$(date +'%s')
    if [ $current_time -ge $filter_start -o $current_time -lt $filter_end ]; then
        if [ "$(pidof hyprsunset)" == '' ]; then
            hyprsunset -t 5000 -g 80 &
        fi
    else
        if [ "$(pidof hyprsunset)" != '' ]; then
            killall hyprsunset
        fi
    fi
    sleep 600
done
