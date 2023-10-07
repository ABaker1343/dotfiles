for opt in $@;
do
    case "$opt" in
        --pretty)
            swaymsg gaps outer all set 4;
            swaymsg gaps outer 4;
            swaymsg gaps inner all set 4;
            swaymsg gaps inner 4;
            swaymsg smart_borders off;
            swaymsg default_border pixel 4
            swaymsg border pixel 4
            ;;
        --no-pretty)
            swaymsg gaps outer all set 0;
            swaymsg gaps outer 0;
            swaymsg gaps inner all set 0;
            swaymsg gaps inner 0;
            swaymsg smart_borders on;
            swaymsg default_border pixel 1
            swaymsg border pixel 1
            ;;
    esac
done

