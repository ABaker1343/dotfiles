for arg in $@; do
    case $arg in
        --discord)
            shift
            pid="$(pidof Discord)"
            if [ -z "$pid" ]; then 
                flatpak run com.discordapp.Discord &
            else
                hyprctl dispatch workspace 9
            fi
            ;;
        --spotify)
            shift
            pid="$(pidof spotify)"
            if [ -z "$pid" ]; then 
                flatpak run com.spotify.Client &
            else
                hyprctl dispatch workspace 10
            fi
            ;;
        --steam)
            shift
            pid=$(pidof steam)
            if [ -z "$pid" ]; then 
                gamemoderun flatpak run com.valvesoftware.Steam &
            else
                hyprctl dispatch workspace 5
            fi
            ;;
    esac
done
