for arg in $@; do
    case $arg in
        --discord)
            shift
            pid="$(pidof Discord)"
            if [ -z "$pid" ]; then 
                flatpak run com.discordapp.Discord &
            else
                swaymsg workspace number 9
            fi
            ;;
        --spotify)
            shift
            pid="$(pidof spotify)"
            if [ -z "$pid" ]; then 
                flatpak run com.spotify.Client &
            else
                swaymsg workspace number 10
            fi
            ;;
        --steam)
            shift
            pid=$(pidof steam)
            if [ -z "$pid" ]; then 
                gamemoderun flatpak run com.valvesoftware.Steam &
            else
                swaymsg workspace number 5
            fi
            ;;
    esac
done
