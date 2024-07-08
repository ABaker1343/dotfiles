choices="pretty
floating-bar
rectangular
contrast
minimal"

selection=$(echo "$choices" | rofi -dmenu)

~/.config/hypr/scripts/hyprpretty "$selection"
