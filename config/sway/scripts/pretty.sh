for opt in $@;
do
    case "$opt" in
        --pretty)
            swaymsg gaps outer all set 4;
            swaymsg gaps inner all set 4;
            swaymsg smart_gaps off;
            swaymsg smart_borders off;
            ;;
        --no-pretty)
            swaymsg gaps outer all set 0;
            swaymsg gaps inner all set 0;
            swaymsg smart_gaps on;
            swaymsg smart_borders on;
            ;;
    esac
done

