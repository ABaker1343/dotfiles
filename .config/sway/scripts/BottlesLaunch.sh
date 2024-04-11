#1/bin/sh

bottles=$(flatpak run --command=bottles-cli com.usebottles.bottles list bottles | \
    awk '{for(i=2;i<NF;i++) printf $i " "; print $NF}' | \
    tail -n +2
)

#echo "$bottles"

programs=""

IFS=$'\n' # change delimiter in for loop
for bottle in $bottles;
do
    bottlePrograms=$(flatpak run --command=bottles-cli com.usebottles.bottles programs -b $bottle | \
        awk '{for(i=2;i<NF;i++) printf $i " "; print $NF}' | \
        tail -n +2 | \
        sed -e "s/^/$bottle | /"
    )
    
    echo "$bottle"
    programs="${programs} ${bottlePrograms}"$'\n'
    echo "$programs"
done

selection=$(echo "$programs" | rofi -dmenu -i)

echo "$selection"

selectedBottle=$(echo $selection | awk -F '|' '{ print $1 }' | sed -e 's/ $//' | sed -e 's/^ //')
selectedProgram=$(echo $selection | awk -F '|' '{ print $2 }' | sed -e 's/ $//' | sed -e 's/^ //')

echo $selectedBottle
echo $selectedProgram

flatpak run --command=bottles-cli com.usebottles.bottles run -b "$selectedBottle" -p "$selectedProgram"
