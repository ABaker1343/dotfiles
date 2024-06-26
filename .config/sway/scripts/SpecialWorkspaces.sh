for arg in $@; do
    case $arg in
        --discord)
            shift
            pid="$(pidof Discord)"
            if [ -z "$pid" ]; then 
                flatpak run com.discordapp.Discord &
            fi
            swaymsg workspace number 9
            ;;
        --spotify)
            shift
            pid="$(pidof spotify)"
            if [ -z "$pid" ]; then 
                flatpak run com.spotify.Client &
            fi
            swaymsg workspace number 10
            ;;
        --steam)
            shift
            pid=$(pidof steam)
            if [ -z "$pid" ]; then 
                steam
                # gamescope -e -W 2560 -H 1440 -S stretch -F fsr -- steam -tenfoot -steamos
                # gamescope -e -W 2560 -H 1440 -S stretch -F fsr -- steam -steamos
            else
                swaymsg workspace number 5
            fi
            ;;
    esac
done
