#!/bin/sh

function GetSteamGames {
    # STEAMDIR=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps
    STEAMDIR=~/.steam/root/steamapps
    STEAM_GAMES_NAMES=$(awk '$1 ~ /^\"appid\"$|^\"name\"$/ {token=substr($1,2,length($1)-2); for (i=2; i<NF; i++) printf $i " "; if (token ~ /name/) print $NF; else printf substr($NF,2,length($NF)-2) " "}' $STEAMDIR/appmanifest*.acf)
    STEAM_GAMES_NAMES="$(echo "$STEAM_GAMES_NAMES" | awk '{print "Steam: " $0}')"

    echo "$STEAM_GAMES_NAMES"
}

function GetBottlesGames {
    BOTTLES_BOTTLES=$(flatpak run --command=bottles-cli com.usebottles.bottles list bottles | \
        awk '{for(i=2;i<NF;i++) printf $i " "; print $NF}' | \
        tail -n +2
    )

    BOTTLES_PROGRAMS=""

    IFS=$'\n' # change delimiter in for loop
    for bottle in $BOTTLES_BOTTLES;
    do
        this_bottle_programs=$(flatpak run --command=bottles-cli com.usebottles.bottles programs -b $bottle | \
            awk '{for(i=2;i<NF;i++) printf $i " "; print $NF}' | \
            tail -n +2 | \
            sed -e "s/^/$bottle | /"
        )
    
        BOTTLES_PROGRAMS="${BOTTLES_PROGRAMS} ${this_bottle_programs}"$'\n'
    done

    BOTTLES_PROGRAMS=$(echo "$BOTTLES_PROGRAMS" | awk '{print "Bottles: " $0}')

    echo "$BOTTLES_PROGRAMS"
}

# get games
steam_games="$(GetSteamGames)"
bottles_games="$(GetBottlesGames)"

# concat with new line
all_games="$steam_games
$bottles_games"

echo "all_games"
echo "$all_games"

selection=$(echo "$all_games" | rofi -dmenu -i -m 1)

echo "selection: $selection"

launch_program="$(echo $selection | awk '{print $1}')"
stripped_selection=$(echo "$selection" | cut -d ' ' -f 1 --complement)

echo "launch program: $launch_program"

if [ "$launch_program" = "Bottles:" ]; then
    # lanch with bottles
    echo "bottles selection: $stripped_selection"
    selectedBottle=$(echo $stripped_selection | awk -F '|' '{ print $1 }' | sed -e 's/ $//' | sed -e 's/^ //')
    selectedProgram=$(echo $stripped_selection | awk -F '|' '{ print $2 }' | sed -e 's/ $//' | sed -e 's/^ //')
    flatpak run --command=bottles-cli com.usebottles.bottles run -b "$selectedBottle" -p "$selectedProgram"
fi

if [ "$launch_program" = "Steam:" ]; then
    #launch with steam
    echo "steam selection: $stripped_selection"
    # gamemoderun flatpak run com.valvesoftware.Steam "steam://launch/$(echo "$stripped_selection" | awk '{print $1}')"
    steam "steam://launch/$(echo "$stripped_selection" | awk '{print $1}')"
fi

if [ -z "$selection" ]; then
    return 0;
fi

