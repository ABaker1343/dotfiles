xclock -digital -strftime %H:%M -face GoMono-50 -bg black -fg white -fn GoMono &
clock_pid=$(jobs -p)
sleep 1
kill $clock_pid
