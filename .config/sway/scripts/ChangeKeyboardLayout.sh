PREV_STATE_FILE=~/.config/sway/prev_keyboard_layout
available_layouts=$'gb\nus'

function SetLayout {
    local layout=$1
    swaymsg input type:keyboard xkb_layout $layout
    echo $layout > $PREV_STATE_FILE
}

if [ "$1" == "--prev" ]; then
    SetLayout $(cat $PREV_STATE_FILE)
    exit
fi

chosen_layout=$(echo "$available_layouts" | rofi -dmenu)
SetLayout $chosen_layout
