choices="pretty
floating-bar
rectangular
minimal"

selection=$(echo "$choices" | rofi -dmenu)

~/.config/hypr/scripts/hyprpretty "$selection"
