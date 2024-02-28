STEAMDIR=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps
STEAM_GAMES_NAMES=$(awk '$1 ~ /^\"appid\"$|^\"name\"$/ {token=substr($1,2,length($1)-2); for (i=2; i<NF; i++) printf $i " "; if (token ~ /name/) print $NF; else printf substr($NF,2,length($NF)-2) " "}' $STEAMDIR/appmanifest*.acf)

echo "$STEAM_GAMES"
selection=$(echo "$STEAM_GAMES_NAMES" | rofi -dmenu -i -m 1)
echo "$selection"

if [ -z "$selection" ]; then
    return 0
fi

gamemoderun flatpak run com.valvesoftware.Steam "steam://launch/$(echo "$selection" | awk '{print $1}')"
