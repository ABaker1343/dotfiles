prev_state_file=~/.config/sway/prev_pretty_state

SetPretty() {
    swaymsg gaps outer all set 4;
    swaymsg gaps outer 4;
    swaymsg gaps inner all set 4;
    swaymsg gaps inner 4;
    swaymsg smart_borders off;
    swaymsg default_border pixel 4
    swaymsg border pixel 4

    echo "pretty" > $prev_state_file
}

SetNoPretty() {
    swaymsg gaps outer all set 0;
    swaymsg gaps outer 0;
    swaymsg gaps inner all set 0;
    swaymsg gaps inner 0;
    swaymsg smart_borders on;
    swaymsg default_border pixel 1
    swaymsg border pixel 1

    echo "no-pretty" > $prev_state_file
}

for opt in $@;
do
    case "$opt" in
        --pretty)
            SetPretty
            ;;
        --no-pretty)
            SetNoPretty
            ;;
        --restore)
            prev_state="$(cat $prev_state_file)"
            case "$prev_state" in
                "pretty")
                    SetPretty
                    ;;
                "no-pretty")
                    SetNoPretty
                    ;;
                *)
                    SetPretty
                    ;;
            esac
            ;;
    esac
done

