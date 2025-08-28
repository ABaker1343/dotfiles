function recover {
    hyprpaper &
    xrandr --output DP-2 --primary
}

function restore_lock {
    hyprctl --instance 0 dispatch "exec hyprlock"
}

for arg in $@; do 
    case $arg in
        --recover)
            recover
            ;;

        --lock)
            failed=true
            sleep 1 && \
                hyprctl dispatch dpms off && \
                hyprlock && \
                hyprctl dispatch dpms on && \
                recover && \
                failed=false

            if [ $failed ]; then
                restore_lock && \
                recover
            fi
            ;;
    esac
done
